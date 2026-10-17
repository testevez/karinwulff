resource "aws_route53_record" "apex_a" {
  zone_id = var.hosted_zone_id
  name    = local.apex_domain
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.site.domain_name
    zone_id                = aws_cloudfront_distribution.site.hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "apex_aaaa" {
  zone_id = var.hosted_zone_id
  name    = local.apex_domain
  type    = "AAAA"

  alias {
    name                   = aws_cloudfront_distribution.site.domain_name
    zone_id                = aws_cloudfront_distribution.site.hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "www_a" {
  zone_id = var.hosted_zone_id
  name    = local.www_domain
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.site.domain_name
    zone_id                = aws_cloudfront_distribution.site.hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "www_aaaa" {
  zone_id = var.hosted_zone_id
  name    = local.www_domain
  type    = "AAAA"

  alias {
    name                   = aws_cloudfront_distribution.site.domain_name
    zone_id                = aws_cloudfront_distribution.site.hosted_zone_id
    evaluate_target_health = false
  }
}

# Apex TXT records. Route 53 allows only one TXT record set per name, so every
# apex TXT value (site verifications, SPF, ...) goes in this one list.
resource "aws_route53_record" "apex_txt" {
  zone_id = var.hosted_zone_id
  name    = local.apex_domain
  type    = "TXT"
  ttl     = 300
  records = [
    # Google Search Console domain property (added 2026-10-17)
    "google-site-verification=BOSb7-3UdAuxa-lH7hQ09FAOsbkJJXyn8psqWY2lDx4",
  ]
}
