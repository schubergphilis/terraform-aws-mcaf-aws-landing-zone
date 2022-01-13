# CHANGELOG

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/) and this project adheres to [Semantic Versioning](http://semver.org/).

## 0.14.0 (2022-01-22)

- Add an account level S3 public access policy to by default block public access to all S3 buckets within the landing zone accounts. ([#125](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/125))

## 0.13.0 (2021-11-17)

- Add support for assigning managed policies in SSO permission sets ([#124](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/124))

## 0.12.2 (2021-11-10)

BUG FIXES

- Fixed malfunction policy issue. Allowed regions policy template wasn't using the appropariate allowed_region property ([#123](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/123))

## 0.12.1 (2021-10-27)
- Conditionally merges DenyAllRegionsOutsideAllowedList, DenyDeletingCloudTrailLogStream, DenyDisablingSecurityHub, RequireAllEc2RolesToUseV2, RequireImdsV2, MaxImdsHopLimit, and DenyLeavingOrg policies into one `LandinZone-RootPolicies` policy to avoid exceeding SCP limit (5 policies per org) [Quotas for AWS Organizations](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_reference_limits.html)
([#120](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/120))

## 0.12.0 (2021-09-22)

- Set the audit account as security hub administrator account for the organization and automatically enable Security Hub for new accounts in the organization ([#121](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/121))

## 0.11.0 (2021-09-22)

- Add additional IAM activity monitors ([#119](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/119))

## 0.10.6 (2021-09-13)

- Upgrade Datadog MCAF module used in core accounts to latest version ([#118](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/118))

## 0.10.5 (2021-09-07)

- Update IAM Activity Monitor for root usage to match CIS AWS rule 1.1 ([#117](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/117))

## 0.10.4 (2021-08-23)

- Add a `DenyDisablingSecurityHub` SCP that is attached to all AWS Organisation OUs ([#110](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/110))

## 0.10.3 (2021-08-04)

ENHANCEMENTS

- Enable by default AWS GuardDuty S3 protection ([#111](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/111))

## 0.10.2 (2021-07-13)

ENHANCEMENTS

- Update KMS module ([#109](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/109))

## 0.10.1 (2021-06-30)

ENHANCEMENTS

- Make list of SecurityHub Standards configurable ([#108](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/108))

## 0.10.0 (2021-05-27)

ENHANCEMENTS

- Add support for multiple SSO Permission Set assignments ([#106](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/106))

## 0.9.1 (2021-05-11)

ENHANCEMENTS

- Added support for KMS Key policy ([#104](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/104))

## 0.9.0 (2021-04-12)

ENHANCEMENTS

- Removal of the local AVM module. AVM module has been split up into 2 modules to allow for more flexibility: AVM core functionality has been moved to [MCAF Account Vending Machine (AVM) module](https://github.com/schubergphilis/terraform-aws-mcaf-avm) and all other functionality has been moved to the [MCAF Account Baseline module](https://github.com/schubergphilis/terraform-aws-mcaf-account-baseline).  ([#102](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/102))

## 0.8.2 (2021-04-08)

BUG FIXES

- Adds `is_multi_region_trail = true` & `enable_log_file_validation = true` for cloudtrail resource regarding TFSEC#AWS063 & #AWS064 ([#101](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/101))
- Allows access-analyzer to be used outside region since it's a global service + adds ignores for tfsec ([#100](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/100))

## 0.8.1 (2021-03-22)

ENHANCEMENTS

- Add support to use a TFC agent pool ([#98](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/98))

## 0.8.0 (2021-03-05)

ENHANCEMENTS

- Add support to manage AWS SSO resources ([#95](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/95))

## 0.7.4 (2021-03-03)

ENHANCEMENTS

- Add SCP to protect CloudTrail LogStream ([#94](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/94))

BUG FIXES

- Prevent error when aws_required_tags is not set ([#93](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/93))
- Improve tagging of resources ([#92](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/92))

## 0.7.3 (2021-02-06)

ENHANCEMENTS

- Adding tag compliance capability using tag policies ([#84](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/84))

## 0.7.2 (2021-02-25)

ENHANCEMENTS

- Add capability to disable SSO activity monitoring in the AVM module ([#89](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/89))

## 0.7.1 (2021-02-24)

BUG FIXES

- Update SCP to support AWS ChatBot ([#88](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/88))

## 0.7.0 (2021-02-24)

ENHANCEMENTS

- Update IAM activity monitoring in the AVM module ([#86](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/86))
- Update IAM activity monitoring in the core accounts ([#85](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/85))

## 0.6.1 (2021-02-09)

BUG FIXES

- Add missing provider to the `aws_iam_account_password_policy` and `aws_ebs_encryption_by_default` resources ([#82](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/82))

## 0.6.0 (2021-02-02)

BUG FIXES

- Fix error when trying to read SNS topic policy from data source ([#78](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/78))

ENHANCEMENTS

- Enable AWS EBS encryption by default ([#79](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/79))
- Refactored Securityhub to use organizations and removed unused Guardduty resources ([#80](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/80))

## 0.5.1 (2021-01-15)

BUG FIXES

- Fix `workspace_id` output in AVM module when the module does not create a workspace ([#76](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/76))

## 0.5.0 (2021-01-15)

ENHANCEMENTS

- Add ability to opt out of workspace create when you want to create the workspace and workspace user outside of the AVM module ([#74](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/74))

## 0.4.9 (2021-01-11)

BUG FIXES

- Fix bug in output `monitor_iam_access_sns_topic_arn`, this needs to be the event bus arn. Changed the value and the output to match the event bus in the audit account ([#72](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/72))

## 0.4.8 (2021-01-11)

BUG FIXES

- Fix bug in `monitor_iam_access` pattern in the AVM module, `userName` must be an array ([#70](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/70))

## 0.4.7 (2021-01-08)

BUG FIXES

- Enable key rotation for the kms resources ([#68](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/68))

## 0.4.6 (2021-01-08)

ENHANCEMENTS

- Add notifications for Security Hub findings via SNS topic LandingZone-SecurityHubFindings ([#56](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/56))

## 0.4.5 (2021-01-08)

BUG FIXES

- Add `endpoint_auto_confirms` variable to the AWS Config SNS topic ([#62](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/62)) ([#64](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/64))

- Modify accountID of the AWS Config SNS topic ([#65](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/65))

## 0.4.4 (2021-01-05)

BUG FIXES

- Resolve issue where an empty `sns_security_subscription` variable causes a failure and restructured the variable to a map as `for_each` in Terraform 0.14 cannot be used with an object that has sensitive values ([#60](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/60))

## 0.4.3 (2021-01-04)

ENHANCEMENTS

- Set default password policy parameters for the audit, logging, master accounts ([#57](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/57))

ENHANCEMENTS

- Forward SecurityHub findings to AggregateSecurityNotifications SNS topic ([#56](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/56))

## 0.4.2 (2020-12-29)

ENHANCEMENTS

- Add support for subscribing to aggregated security SNS topic ([#41](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/41))

## 0.4.1 (2020-12-29)

ENHANCEMENTS

- Add support for exemptions to the AWS region restriction ([#31](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/31))
- Set default password policy parameters for the AWS accounts ([#51](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/51)) ([#43](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/43))

BUG FIXES

- Loosen provider version constraints to allow more flexibility for module users ([#53](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/53))

## 0.4.0 (2020-12-16)

ENHANCEMENTS

- Add a `DenyLeavingOrg` SCP that is attached to all AWS Organisation OUs ([#39](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/39))
- Add a `RequireUseOfIMDSv2` SCP that is attached to all AWS Organisation OUs by default ([#38](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/38))
- Add a `DenyRootUser` SCP that can be attached to AWS Organisation OUs ([#37](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/37))

## 0.3.2 (2020-12-14)

BUG FIXES

- Fix support for Datadog region ([#36]https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/36))

## 0.3.1 (2020-12-09)

ENHANCEMENTS

- Add support for usage of different Datadog region ([#32](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/32)) ([#34](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/34))

## 0.3.0 (2020-12-04)

ENHANCEMENTS

- Add support for an additional CloudTrail Trail configuration ([#28](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/28))

## 0.2.1 (2020-11-30)

BUG FIXES

- Fix recreation of the aws_securityhub_member resource ([#25](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/25))
- Remove MCAF provider version pin in AVM module ([#26](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/26))

## 0.2.0 (2020-11-20)

ENHANCEMENTS

- Add support for AWS GuardDuty ([#12](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/12))
- Modify terraform-aws-mcaf-workspace version to 0.3.0 in the avm module, in order to prevent github error ([#22](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/22))
- Add KMS Key in the Audit account ([#18](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/18))
- Add support for monitoring IAM access ([#15](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/15))
- Add support for multiple AWS Config Aggregators ([#14](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/14))
- Add support for defining specific account name for AWS Service Catalog ([#13](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/13))
- Make account and email names more flexible. ([#17](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/17))

BUG FIXES

- Fix multiple bugs in unreleased features ([#23](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/23))
- Add filter to create rules only for the right identities ([#21](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/21))
- Fix errors when monitor_iam_access is null ([#19](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/19))
- Add condition to audit AWS Config Aggregate Auth ([#20](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/20))

## 0.1.0 (2020-11-16)

- Adds optional SCP to restrict allowed regions ([#11](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/11))
- Adds support for optional AWS Config Aggregate Authorization ([#10](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/10))
- Enables AWS Config in the master account ([#9](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/9))
- Adds support for custom tags to AVM module ([#8](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/8))
- Adds support for passing SSH Key Id to TFE workspace ([#7](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/7))
- Adds output to AVM module ([#6](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/6))
- Adds support for AWS-Datadog integration ([#5](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/5))
- Adds support for AWS Config Rules ([#4](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/4))
- Enables security hub for all AWS Organization accounts ([#3](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/3))
- Removes embedded Okta Groups ([#2](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/2))
- First version ([#1](https://github.com/schubergphilis/terraform-aws-mcaf-landing-zone/pull/1))
