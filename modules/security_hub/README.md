# AWS Security Hub

Terraform module to setup and manage AWS Security Hub.

<!--- BEGIN_TF_DOCS --->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| member\_accounts | A map of accounts that should be added as SecurityHub Member Accounts (format: account\_id = email) | `map(string)` | `{}` | no |
| product\_arns | A list of the ARNs of the products you want to import into Security Hub | `list(string)` | `[]` | no |
| region | The name of the AWS region where SecurityHub will be enabled | `string` | `"eu-west-1"` | no |
| sns\_subscription | Aggregated security SNS topic subscription options | <pre>list(object({<br>    account_id = string<br>    endpoint   = string<br>    protocol   = string<br>  }))</pre> | `null` | no |

## Outputs

No output.

<!--- END_TF_DOCS --->
