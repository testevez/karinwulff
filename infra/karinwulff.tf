# karinwulff.com — name-capture domain (bought in Route 53, Oct 2026).
# Every request to https://karinwulff.com or https://www.karinwulff.com gets a
# 301 to the same path on https://avlcurious.com, so name searches feed the
# main site's SEO authority instead of competing with it.
#
# Its own small CloudFront distribution + certificate keeps the main site's
# certificate and distribution untouched. The redirect happens in a viewer-
# request function, so the origin is never contacted.

locals {
  redirect_apex    = "karinwulff.com"
  redirect_www     = "www.${local.redirect_apex}"
  redirect_aliases = [local.redirect_apex, local.redirect_www]
}

# Route 53 creates this hosted zone automatically when the domain is purchased.
data "aws_route53_zone" "redirect" {
  name         = local.redirect_apex
  private_zone = false
}

resource "aws_acm_certificate" "redirect" {
  domain_name               = local.redirect_apex
  subject_alternative_names = [local.redirect_www]
  validation_method         = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route53_record" "redirect_cert_validation" {
  for_each = {
    for dvo in aws_acm_certificate.redirect.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.redirect.zone_id
}

resource "aws_acm_certificate_validation" "redirect" {
  certificate_arn         = aws_acm_certificate.redirect.arn
  validation_record_fqdns = [for r in aws_route53_record.redirect_cert_validation : r.fqdn]
}

resource "aws_cloudfront_function" "redirect_to_main" {
  name    = "karinwulff-redirect-to-avlcurious"
  runtime = "cloudfront-js-2.0"
  comment = "301 every karinwulff.com request to the same path on ${local.apex_domain}"
  publish = true
  code    = <<-EOT
    function handler(event) {
      var request = event.request;
      var qs = Object.keys(request.querystring).map(function (k) {
        var q = request.querystring[k];
        var vals = q.multiValue ? q.multiValue : [q];
        return vals.map(function (v) { return k + (v.value ? '=' + v.value : ''); }).join('&');
      }).join('&');
      return {
        statusCode: 301,
        statusDescription: 'Moved Permanently',
        headers: { location: { value: 'https://${local.apex_domain}' + request.uri + (qs ? '?' + qs : '') } },
      };
    }
  EOT
}

resource "aws_cloudfront_distribution" "redirect" {
  enabled         = true
  is_ipv6_enabled = true
  comment         = "karinwulff.com — 301 redirect to ${local.apex_domain}"
  http_version    = "http2and3"
  price_class     = "PriceClass_100"
  aliases         = local.redirect_aliases

  # Required by CloudFront but never reached: the viewer-request function
  # answers every request with a redirect.
  origin {
    domain_name              = aws_s3_bucket.site.bucket_regional_domain_name
    origin_id                = "s3-${aws_s3_bucket.site.id}"
    origin_access_control_id = aws_cloudfront_origin_access_control.site.id
  }

  default_cache_behavior {
    target_origin_id       = "s3-${aws_s3_bucket.site.id}"
    viewer_protocol_policy = "redirect-to-https"
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    compress               = true
    cache_policy_id        = "658327ea-f89d-4fab-a63d-7e88639e58f6"

    function_association {
      event_type   = "viewer-request"
      function_arn = aws_cloudfront_function.redirect_to_main.arn
    }
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn      = aws_acm_certificate_validation.redirect.certificate_arn
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.2_2021"
  }
}

resource "aws_route53_record" "redirect_alias" {
  for_each = {
    for pair in setproduct(local.redirect_aliases, ["A", "AAAA"]) : "${pair[0]}-${pair[1]}" => {
      name = pair[0]
      type = pair[1]
    }
  }

  zone_id = data.aws_route53_zone.redirect.zone_id
  name    = each.value.name
  type    = each.value.type

  alias {
    name                   = aws_cloudfront_distribution.redirect.domain_name
    zone_id                = aws_cloudfront_distribution.redirect.hosted_zone_id
    evaluate_target_health = false
  }
}

# Apex TXT records for karinwulff.com (one record set per name in Route 53).
resource "aws_route53_record" "redirect_apex_txt" {
  zone_id = data.aws_route53_zone.redirect.zone_id
  name    = local.redirect_apex
  type    = "TXT"
  ttl     = 300
  records = [
    # Google Search Console domain property (added 2026-10-17)
    "google-site-verification=7TfW7t_zQkrAzf3AwpjM0m_YUUMT74tD5DGUJ992BWg",
  ]
}

output "redirect_distribution_id" {
  description = "CloudFront distribution serving the karinwulff.com redirect."
  value       = aws_cloudfront_distribution.redirect.id
}
