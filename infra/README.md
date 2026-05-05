# Infra — AVL Curious site

Terraform that provisions the static-site stack for **avlcurious.com** on AWS.

## What it builds

- **S3 bucket** (`avlcurious-site`) — private, versioned, SSE-S3, CloudFront-only access via OAC
- **CloudFront distribution** — HTTPS-only (TLS 1.2+), HTTP/2+3, Brotli, ipv6, custom security headers
- **CloudFront Function** — appends `index.html` to pretty paths so Astro's per-folder routing works
- **ACM certificate** in us-east-1 for `avlcurious.com` + `www.avlcurious.com`, DNS-validated via Route 53
- **Route 53 alias records** (A + AAAA) at apex and www → CloudFront

State is local (`terraform.tfstate`) and gitignored. Migrate to an S3 backend later if multiple people will run this.

## Prereqs

- `aws` CLI authenticated to profile `avlcurious` (SSO; account `153457164262`)
- `terraform >= 1.6`
- The Route 53 hosted zone for `avlcurious.com` already exists (it does — created by Route 53 Registrar at domain purchase)

## Usage

```bash
cd infra/
terraform init
terraform plan
terraform apply
```

After apply, get the deploy targets:

```bash
terraform output
```

Use those in the GitHub Actions deploy workflow:

```bash
aws s3 sync ../dist/ s3://$(terraform output -raw site_bucket)/ --delete --profile avlcurious
aws cloudfront create-invalidation --distribution-id $(terraform output -raw cloudfront_distribution_id) --paths "/*" --profile avlcurious
```

## Notes on cost

- **CloudFront Price Class 100** (US/Canada/Europe edges) keeps cost predictable; bump to `PriceClass_All` only if traffic from APAC/SA matters.
- S3 + CloudFront for a small static site = roughly **$2–6/mo** at modest traffic.
- Route 53 hosted zone = **$0.50/mo**.
- ACM certs = free.

## Adding karinwulff.com 301-redirect (later)

Once `karinwulff.com` is registered in Route 53, add a sibling stack (separate `.tf` files or a module) that creates:

- A redirect-only S3 bucket configured as a website endpoint with `redirect_all_requests_to = "https://avlcurious.com"`
- A separate ACM cert for `karinwulff.com` + `www.karinwulff.com`
- A separate CloudFront distribution pointing at that redirect bucket
- Route 53 records on the karinwulff.com hosted zone

Out of scope for the initial apply.
