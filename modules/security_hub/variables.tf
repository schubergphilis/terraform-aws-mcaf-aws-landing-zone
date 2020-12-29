variable "account_id" {
  type        = string
  default     = null
  description = "AWS Audit Account ID"
}

variable "member_accounts" {
  type        = map(string)
  default     = {}
  description = "A map of accounts that should be added as SecurityHub Member Accounts (format: account_id = email)"
}

variable "product_arns" {
  type        = list(string)
  default     = []
  description = "A list of the ARNs of the products you want to import into Security Hub"
}

variable "region" {
  type        = string
  default     = "eu-west-1"
  description = "The name of the AWS region where SecurityHub will be enabled"
}

variable "sns_subscription" {
  type = list(object({
    endpoint = string
    protocol = string
  }))
  default     = null
  description = "Aggregated security SNS topic subscription options"
}
