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
| [aws_dynamodb_table.main](https://registry.terraform.io/providers/hashicorp/aws/4.52.0/docs/resources/dynamodb_table) | resource |
| [aws_iam_policy.tfstate_bucket](https://registry.terraform.io/providers/hashicorp/aws/4.52.0/docs/resources/iam_policy) | resource |
| [aws_iam_policy.tfstate_dynamodb](https://registry.terraform.io/providers/hashicorp/aws/4.52.0/docs/resources/iam_policy) | resource |
| [aws_s3_bucket.logs](https://registry.terraform.io/providers/hashicorp/aws/4.52.0/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket.main](https://registry.terraform.io/providers/hashicorp/aws/4.52.0/docs/resources/s3_bucket) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_access_policy_name"></a> [bucket\_access\_policy\_name](#input\_bucket\_access\_policy\_name) | iam policy name for tfstate bucket access | `string` | `"S3StateAccess"` | no |
| <a name="input_dynamodb_access_policy_name"></a> [dynamodb\_access\_policy\_name](#input\_dynamodb\_access\_policy\_name) | iam policy name for tfstate dynamodb access | `string` | `"DynamoDBStateLockAccess"` | no |
| <a name="input_log_bucket"></a> [log\_bucket](#input\_log\_bucket) | S3 bucket name for tfstate log | `string` | `"s3-tfstate-logs"` | no |
| <a name="input_log_key_prefix"></a> [log\_key\_prefix](#input\_log\_key\_prefix) | To specify a key prefix for tfstate log objects | `string` | `""` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS Region | `string` | `"ap-northeast-2"` | no |
| <a name="input_state_lock_table_name"></a> [state\_lock\_table\_name](#input\_state\_lock\_table\_name) | Dynamodb table name for tfstate lock | `string` | `"TerraformStateLock"` | no |
| <a name="input_tags_environment"></a> [tags\_environment](#input\_tags\_environment) | Resource environment | `string` | `""` | no |
| <a name="input_tags_iac"></a> [tags\_iac](#input\_tags\_iac) | Whether to use IaC | `string` | `"terraform"` | no |
| <a name="input_tags_team"></a> [tags\_team](#input\_tags\_team) | Team that manages the resource | `string` | `""` | no |
| <a name="input_tfstate_bucket"></a> [tfstate\_bucket](#input\_tfstate\_bucket) | S3 bucket name for tfstate | `string` | `"s3-tfstate-management"` | no |
| <a name="input_tfstate_key"></a> [tfstate\_key](#input\_tfstate\_key) | The path where the tfstate file will be saved | `string` | `"/"` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
