variable "aws_region" {
  type        = string
  description = "AWS region. CloudFront + ACM require us-east-1."
  default     = "us-east-1"
}

variable "aws_profile" {
  type        = string
  description = "AWS named profile (configured via aws sso)."
  default     = "avlcurious"
}

variable "domain_name" {
  type        = string
  description = "Apex domain — site is served at https://<domain> and https://www.<domain>."
  default     = "avlcurious.com"
}

variable "hosted_zone_id" {
  type        = string
  description = "Route 53 hosted zone ID for the apex domain."
  default     = "Z079627521W52POF72R9X"
}

variable "site_bucket_name" {
  type        = string
  description = "S3 bucket holding the static site assets. Globally unique."
  default     = "avlcurious-site"
}
