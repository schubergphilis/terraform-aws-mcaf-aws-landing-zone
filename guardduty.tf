// AWS GuardDuty - Management account configuration
resource "aws_guardduty_organization_admin_account" "audit" {
  count = var.aws_guardduty.enabled == true ? 1 : 0

  admin_account_id = var.control_tower_account_ids.audit
}

// AWS GuardDuty - Audit account configuration
resource "aws_guardduty_organization_configuration" "default" {
  count    = var.aws_guardduty.enabled == true ? 1 : 0
  provider = aws.audit

  auto_enable = var.aws_guardduty.enabled
  detector_id = aws_guardduty_detector.audit.id

  datasources {
    kubernetes {
      audit_logs {
        enable = var.aws_guardduty.datasources.kubernetes
      }
    }

    malware_protection {
      scan_ec2_instance_with_findings {
        ebs_volumes {
          auto_enable = var.aws_guardduty.datasources.malware_protection
        }
      }
    }

    s3_logs {
      auto_enable = var.aws_guardduty.datasources.s3_logs
    }
  }

  depends_on = [aws_guardduty_organization_admin_account.audit]
}

resource "aws_guardduty_detector" "audit" {
  provider = aws.audit

  enable                       = var.aws_guardduty.enabled
  finding_publishing_frequency = var.aws_guardduty.finding_publishing_frequency
  tags                         = var.tags

  datasources {
    s3_logs {
      enable = true
    }
  }
}