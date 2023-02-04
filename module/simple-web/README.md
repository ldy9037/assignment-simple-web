<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.1.7 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.52.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.52.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eip.nat_ip](https://registry.terraform.io/providers/hashicorp/aws/4.52.0/docs/resources/eip) | resource |
| [aws_iam_policy.log_bucket](https://registry.terraform.io/providers/hashicorp/aws/4.52.0/docs/resources/iam_policy) | resource |
| [aws_internet_gateway.main](https://registry.terraform.io/providers/hashicorp/aws/4.52.0/docs/resources/internet_gateway) | resource |
| [aws_launch_template.web_server](https://registry.terraform.io/providers/hashicorp/aws/4.52.0/docs/resources/launch_template) | resource |
| [aws_lb.main](https://registry.terraform.io/providers/hashicorp/aws/4.52.0/docs/resources/lb) | resource |
| [aws_nat_gateway.main](https://registry.terraform.io/providers/hashicorp/aws/4.52.0/docs/resources/nat_gateway) | resource |
| [aws_route_table.private](https://registry.terraform.io/providers/hashicorp/aws/4.52.0/docs/resources/route_table) | resource |
| [aws_route_table.public](https://registry.terraform.io/providers/hashicorp/aws/4.52.0/docs/resources/route_table) | resource |
| [aws_route_table_association.private](https://registry.terraform.io/providers/hashicorp/aws/4.52.0/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public](https://registry.terraform.io/providers/hashicorp/aws/4.52.0/docs/resources/route_table_association) | resource |
| [aws_s3_bucket.logs](https://registry.terraform.io/providers/hashicorp/aws/4.52.0/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_acl.logs_acl](https://registry.terraform.io/providers/hashicorp/aws/4.52.0/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_policy.alb_logging](https://registry.terraform.io/providers/hashicorp/aws/4.52.0/docs/resources/s3_bucket_policy) | resource |
| [aws_subnet.private](https://registry.terraform.io/providers/hashicorp/aws/4.52.0/docs/resources/subnet) | resource |
| [aws_subnet.public](https://registry.terraform.io/providers/hashicorp/aws/4.52.0/docs/resources/subnet) | resource |
| [aws_vpc.main](https://registry.terraform.io/providers/hashicorp/aws/4.52.0/docs/resources/vpc) | resource |
| [aws_ami.ubuntu_22](https://registry.terraform.io/providers/hashicorp/aws/4.52.0/docs/data-sources/ami) | data source |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/4.52.0/docs/data-sources/caller_identity) | data source |
| [aws_elb_service_account.main](https://registry.terraform.io/providers/hashicorp/aws/4.52.0/docs/data-sources/elb_service_account) | data source |
| [aws_iam_policy_document.allow_access_alb](https://registry.terraform.io/providers/hashicorp/aws/4.52.0/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alb_log_enble"></a> [alb\_log\_enble](#input\_alb\_log\_enble) | Whether to enable ALB logs | `bool` | `true` | no |
| <a name="input_alb_name"></a> [alb\_name](#input\_alb\_name) | ALB name | `string` | `"simple-web-external-alb"` | no |
| <a name="input_availability_zones"></a> [availability\_zones](#input\_availability\_zones) | List of AZs where subnets will be created | `list(string)` | `[]` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Instance type for web server | `string` | `"t2.micro"` | no |
| <a name="input_launch_template_name"></a> [launch\_template\_name](#input\_launch\_template\_name) | Name for web server launch template | `string` | `"web-server-template"` | no |
| <a name="input_log_bucket"></a> [log\_bucket](#input\_log\_bucket) | S3 bucket name for simple-web log | `string` | `"s3-simple-web-logs"` | no |
| <a name="input_log_bucket_access_policy_name"></a> [log\_bucket\_access\_policy\_name](#input\_log\_bucket\_access\_policy\_name) | iam policy name for log bucket access | `string` | `"S3LogsAccess"` | no |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | Private subnet CIDR block list | `list(string)` | `[]` | no |
| <a name="input_public_subnets"></a> [public\_subnets](#input\_public\_subnets) | Public subnet CIDR block list | `list(string)` | `[]` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS Region | `string` | `"ap-northeast-2"` | no |
| <a name="input_tags_environment"></a> [tags\_environment](#input\_tags\_environment) | Resource environment | `string` | `""` | no |
| <a name="input_tags_iac"></a> [tags\_iac](#input\_tags\_iac) | Whether to use IaC | `string` | `"terraform"` | no |
| <a name="input_tags_team"></a> [tags\_team](#input\_tags\_team) | Team that manages the resource | `string` | `""` | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | VPC CIDR | `string` | `"192.168.0.0/24"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_log_bucket_policy_arn"></a> [log\_bucket\_policy\_arn](#output\_log\_bucket\_policy\_arn) | IAM policy ARN for s3 log bucket access |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
