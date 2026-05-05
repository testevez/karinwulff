locals {
  apex_domain = var.domain_name
  www_domain  = "www.${var.domain_name}"
  aliases     = [local.apex_domain, local.www_domain]
}

data "aws_caller_identity" "current" {}
