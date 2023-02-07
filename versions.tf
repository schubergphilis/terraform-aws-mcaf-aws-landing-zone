terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      version               = ">= 4.40.0"
      configuration_aliases = [aws.audit, aws.logging]
    }
    datadog = {
      source = "datadog/datadog"
    }
    mcaf = {
      source  = "schubergphilis/mcaf"
      version = ">= 0.4.2"
    }
  }
  required_version = ">= 1.3"
}
