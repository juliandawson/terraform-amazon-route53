variable "aws_region" {
  type = string
  description = "AWS region"
  default = "eu-west-2"
}

variable "dns_zone_name" {
  type = string
  description = "Domain name"
  default = "juliandawson.co.uk"
}

variable "github_username" {
  type = string
  description = "GitHub username"
  default = "juliandawson"
}

variable "github_pages_code" {
  type = string
  description = "GitHub Pages domain verification code"
  default = "a4d68e7fe196b22cae918cae105f5d"
}