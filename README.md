# Terraform and Amazon Route53

## Terraform configuration

The following variables can be used to configure the infrastructure.

### Variable sets

##### AWS

| Name                  | Default | Description                                        |
| --------------------- | ------- | -------------------------------------------------- |
| AWS_ACCESS_KEY_ID     |         | AWS access key associated with an IAM user or role |
| AWS_SECRET_ACCESS_KEY |         | Secret key associated with the access key          |

### Variables

| Name              | Default                        | Description                           |
| ----------------- | ------------------------------ | ------------------------------------- |
| aws_region        | eu-west-2                      | AWS region                            |
| dns_zone_name     | juliandawson.co.uk             | Domain name                           |
| github_username   | juliandawson                   | GitHub username                       |
| github_pages_code | a4d68e7fe196b22cae918cae105f5d | GitHub Pages domain verification code |
