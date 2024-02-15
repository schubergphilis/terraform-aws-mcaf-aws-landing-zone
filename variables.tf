variable "additional_auditing_trail" {
  type = object({
    name       = string
    bucket     = string
    kms_key_id = string

    event_selector = optional(object({
      data_resource = optional(object({
        type   = string
        values = list(string)
      }))
      exclude_management_event_sources = optional(set(string), null)
      include_management_events        = optional(bool, true)
      read_write_type                  = optional(string, "All")
    }))
  })
  default     = null
  description = "CloudTrail configuration for additional auditing trail"
}

variable "aws_account_password_policy" {
  type = object({
    allow_users_to_change        = bool
    max_age                      = number
    minimum_length               = number
    require_lowercase_characters = bool
    require_numbers              = bool
    require_symbols              = bool
    require_uppercase_characters = bool
    reuse_prevention_history     = number
  })
  default = {
    allow_users_to_change        = true
    max_age                      = 90
    minimum_length               = 14
    require_lowercase_characters = true
    require_numbers              = true
    require_symbols              = true
    require_uppercase_characters = true
    reuse_prevention_history     = 24
  }
  description = "AWS account password policy parameters for the audit, logging and master account"
}

variable "aws_auditmanager" {
  type = object({
    enabled               = bool
    reports_bucket_prefix = string
  })
  default = {
    enabled               = true
    reports_bucket_prefix = "audit-manager-reports"
  }
  description = "AWS Audit Manager config settings"
}

variable "aws_config" {
  type = object({
    aggregator_account_ids          = optional(list(string), [])
    aggregator_regions              = optional(list(string), [])
    delivery_channel_s3_bucket_name = optional(string, null)
    delivery_channel_s3_key_prefix  = optional(string, null)
    delivery_frequency              = optional(string, "TwentyFour_Hours")
    rule_identifiers                = optional(list(string), [])
  })
  default = {
    aggregator_account_ids          = []
    aggregator_regions              = []
    delivery_channel_s3_bucket_name = null
    delivery_channel_s3_key_prefix  = null
    delivery_frequency              = "TwentyFour_Hours"
    rule_identifiers                = []
  }
  description = "AWS Config settings"

  validation {
    condition     = contains(["One_Hour", "Three_Hours", "Six_Hours", "Twelve_Hours", "TwentyFour_Hours"], var.aws_config.delivery_frequency)
    error_message = "The delivery frequency must be set to \"One_Hour\", \"Three_Hours\", \"Six_Hours\", \"Twelve_Hours\", or \"TwentyFour_Hours\"."
  }
}

variable "aws_config_sns_subscription" {
  type = map(object({
    endpoint = string
    protocol = string
  }))
  default     = {}
  description = "Subscription options for the aws-controltower-AggregateSecurityNotifications (AWS Config) SNS topic"
}

variable "aws_ebs_encryption_by_default" {
  type        = bool
  default     = true
  description = "Set to true to enable AWS Elastic Block Store encryption by default"
}

variable "aws_guardduty" {
  type = object({
    enabled                       = optional(bool, true)
    finding_publishing_frequency  = optional(string, "FIFTEEN_MINUTES")
    ebs_malware_protection_status = optional(bool, true)
    eks_addon_management_status   = optional(bool, true)
    eks_audit_logs_status         = optional(bool, true)
    eks_runtime_monitoring_status = optional(bool, true)
    lambda_network_logs_status    = optional(bool, true)
    rds_login_events_status       = optional(bool, true)
    s3_data_events_status         = optional(bool, true)
  })
  default = {
    enabled                       = true
    finding_publishing_frequency  = "FIFTEEN_MINUTES"
    ebs_malware_protection_status = true
    eks_addon_management_status   = true
    eks_audit_logs_status         = true
    eks_runtime_monitoring_status = true
    lambda_network_logs_status    = true
    rds_login_events_status       = true
    s3_data_events_status         = true
  }
  description = "AWS GuardDuty settings"
}

variable "aws_inspector" {
  type = object({
    enabled                 = optional(bool, false)
    enable_scan_ec2         = optional(bool, true)
    enable_scan_ecr         = optional(bool, true)
    enable_scan_lambda      = optional(bool, true)
    enable_scan_lambda_code = optional(bool, true)
  })
  default = {
    enabled                 = false
    enable_scan_ec2         = true
    enable_scan_ecr         = true
    enable_scan_lambda      = true
    enable_scan_lambda_code = true
  }
  description = "AWS Inspector settings, at least one of the scan options must be enabled"
}

variable "aws_required_tags" {
  type = map(list(object({
    name         = string
    values       = optional(list(string))
    enforced_for = optional(list(string))
  })))
  default     = null
  description = "AWS Required tags settings"

  validation {
    condition     = var.aws_required_tags != null ? alltrue([for taglist in var.aws_required_tags : length(taglist) <= 10]) : true
    error_message = "A maximum of 10 tag keys can be supplied to stay within the maximum policy length."
  }
}

variable "aws_security_hub" {
  type = object({
    enabled                       = optional(bool, true)
    auto_enable_controls          = optional(bool, true)
    auto_enable_default_standards = optional(bool, false)
    control_finding_generator     = optional(string, "SECURITY_CONTROL")
    create_cis_metric_filters     = optional(bool, true)
    product_arns                  = optional(list(string), [])
    standards_arns                = optional(list(string), null)
  })
  default = {
    enabled                       = true
    auto_enable_controls          = true
    auto_enable_default_standards = false
    control_finding_generator     = "SECURITY_CONTROL"
    create_cis_metric_filters     = true
    product_arns                  = []
    standards_arns                = null
  }
  description = "AWS Security Hub settings"

  validation {
    condition     = contains(["SECURITY_CONTROL", "STANDARD_CONTROL"], var.aws_security_hub.control_finding_generator)
    error_message = "The \"control_finding_generator\" variable must be set to either \"SECURITY_CONTROL\" or \"STANDARD_CONTROL\"."
  }
}

variable "aws_security_hub_sns_subscription" {
  type = map(object({
    endpoint = string
    protocol = string
  }))
  default     = {}
  description = "Subscription options for the LandingZone-SecurityHubFindings SNS topic"
}

variable "aws_service_control_policies" {
  type = object({
    allowed_regions                 = optional(list(string), [])
    aws_deny_disabling_security_hub = optional(bool, true)
    aws_deny_leaving_org            = optional(bool, true)
    aws_deny_root_user_ous          = optional(list(string), [])
    aws_require_imdsv2              = optional(bool, true)
    principal_exceptions            = optional(list(string), [])
  })
  default     = {}
  description = "AWS SCP's parameters to disable required/denied policies, set a list of allowed AWS regions, and set principals that are exempt from the restriction"
}

variable "aws_sso_permission_sets" {
  type = map(object({
    assignments         = list(map(list(string)))
    inline_policy       = optional(string, null)
    managed_policy_arns = optional(list(string), [])
    session_duration    = optional(string, "PT4H")
  }))
  default     = {}
  description = "Map of AWS IAM Identity Center permission sets with AWS accounts and group names that should be granted access to each account"
}

variable "control_tower_account_ids" {
  type = object({
    audit   = string
    logging = string
  })
  description = "Control Tower core account IDs"
}

variable "datadog" {
  type = object({
    api_key                 = string
    enable_integration      = bool
    install_log_forwarder   = optional(bool, false)
    log_collection_services = optional(list(string), [])
    site_url                = string
  })
  default     = null
  description = "Datadog integration options for the core accounts"
}

variable "datadog_excluded_regions" {
  type        = list(string)
  description = "List of regions where metrics collection will be disabled."
  default     = []
}

variable "kms_key_policy" {
  type        = list(string)
  default     = []
  description = "A list of valid KMS key policy JSON documents"
}

variable "kms_key_policy_audit" {
  type        = list(string)
  default     = []
  description = "A list of valid KMS key policy JSON document for use with audit KMS key"
}

variable "kms_key_policy_logging" {
  type        = list(string)
  default     = []
  description = "A list of valid KMS key policy JSON document for use with logging KMS key"
}

variable "monitor_iam_activity" {
  type        = bool
  default     = true
  description = "Whether IAM activity should be monitored"
}

variable "monitor_iam_activity_sns_subscription" {
  type = map(object({
    endpoint = string
    protocol = string
  }))
  default     = {}
  description = "Subscription options for the LandingZone-IAMActivity SNS topic"
}

variable "path" {
  type        = string
  default     = "/"
  description = "Optional path for all IAM users, user groups, roles, and customer managed policies created by this module"
}

variable "ses_root_accounts_mail_forward" {
  type = object({
    domain            = string
    from_email        = string
    recipient_mapping = map(any)

    dmarc = object({
      policy = optional(string)
      rua    = optional(string)
      ruf    = optional(string)
    })
  })
  default     = null
  description = "SES config to receive and forward root account emails"
}

variable "tags" {
  type        = map(string)
  description = "Map of tags"
}
