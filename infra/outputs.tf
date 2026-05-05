output "site_bucket" {
  description = "Name of the S3 bucket holding the site assets."
  value       = aws_s3_bucket.site.id
}

output "cloudfront_distribution_id" {
  description = "CloudFront distribution ID (used in deploy invalidations)."
  value       = aws_cloudfront_distribution.site.id
}

output "cloudfront_domain_name" {
  description = "CloudFront-managed domain (use to test before DNS propagates)."
  value       = aws_cloudfront_distribution.site.domain_name
}

output "site_url" {
  description = "Live site URL once DNS propagates."
  value       = "https://${var.domain_name}"
}
