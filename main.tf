terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"

  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "juliandawson"

    workspaces {
      name = "juliandawson-github-io"
    }
  }
}

provider "aws" {
  region = "${var.aws_region}"
}

resource "aws_route53_zone" "dns_zone" {
  name = "${var.dns_zone_name}"
}

# IP addresses for GitHub Pages can be found in the GitHub Docs:
# https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/managing-a-custom-domain-for-your-github-pages-site
resource "aws_route53_record" "dns_record" {
  zone_id = "${aws_route53_zone.dns_zone.id}"
  name    = "${var.dns_zone_name}"
  type    = "A"
  records = [
    "185.199.108.153",
    "185.199.109.153",
    "185.199.110.153",
    "185.199.111.153"
  ]
  ttl = 300
}

resource "aws_route53_record" "dns_record_www" {
  zone_id = "${aws_route53_zone.dns_zone.id}"
  name    = "www.${var.dns_zone_name}"
  type    = "CNAME"
  records = ["${var.github_username}.github.io."]
  ttl = 300
}

resource "aws_route53_record" "dns_record_github_pages" {
  zone_id = "${aws_route53_zone.dns_zone.id}"
  name    = "_github-pages-challenge-${var.github_username}.${var.dns_zone_name}"
  type    = "TXT"
  records = ["${var.github_pages_code}"]
  ttl = 300
}