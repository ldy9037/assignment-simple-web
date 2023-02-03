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
| [aws_iam_role.main](https://registry.terraform.io/providers/hashicorp/aws/4.52.0/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.main](https://registry.terraform.io/providers/hashicorp/aws/4.52.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/4.52.0/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.github_actions_trust](https://registry.terraform.io/providers/hashicorp/aws/4.52.0/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_github_repository"></a> [github\_repository](#input\_github\_repository) | Github repository name | `string` | `""` | no |
| <a name="input_github_username"></a> [github\_username](#input\_github\_username) | Github user name | `string` | `""` | no |
| <a name="input_name"></a> [name](#input\_name) | Assume role name | `string` | `"GithubActionsDeploy"` | no |
| <a name="input_policies"></a> [policies](#input\_policies) | IAM policies for Assume role | `list(string)` | `[]` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS Region | `string` | `"ap-northeast-2"` | no |
| <a name="input_tags_environment"></a> [tags\_environment](#input\_tags\_environment) | Resource environment | `string` | `""` | no |
| <a name="input_tags_iac"></a> [tags\_iac](#input\_tags\_iac) | Whether to use IaC | `string` | `"terraform"` | no |
| <a name="input_tags_team"></a> [tags\_team](#input\_tags\_team) | Team that manages the resource | `string` | `""` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
