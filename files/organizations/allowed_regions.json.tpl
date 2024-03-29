{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "DenyAllRegionsOutsideAllowedList",
            "Effect": "Deny",
            "NotAction": [
                "a4b:*",
                "access-analyzer:*",
                "account:*",
                "acm:*",
                "activate:*",
                "artifact:*",
                "aws-marketplace-management:*",
                "aws-marketplace:*",
                "aws-portal:*",
                "billing:*",
                "billingconductor:*",
                "budgets:*",
                "ce:*",
                "chatbot:*",
                "chime:*",
                "cloudfront:*",
                "cloudtrail:Describe*",
                "cloudtrail:Get*",
                "cloudtrail:List*",
                "cloudtrail:LookupEvents",
                "cloudwatch:Describe*",
                "cloudwatch:Get*",
                "cloudwatch:List*",
                "logs*",
                "compute-optimizer:*",
                "config:*",
                "consoleapp:*",
                "consolidatedbilling:*",
                "cur:*",
                "datapipeline:GetAccountLimits",
                "devicefarm:*",
                "directconnect:*",
                "discovery-marketplace:*",
                "ec2:DescribeRegions",
                "ec2:DescribeTransitGateways",
                "ec2:DescribeVpnGateways",
                "ecr-public:*",
                "fms:*",
                "freetier:*",
                "globalaccelerator:*",
                "health:*",
                "iam:*",
                "importexport:*",
                "invoicing:*",
                "iq:*",
                "kms:*",
                "license-manager:ListReceivedLicenses",
                "lightsail:Get*",
                "mobileanalytics:*",
                "networkmanager:*",
                "notifications-contacts:*",
                "notifications:*",
                "organizations:*",
                "payments:*",
                "pricing:*",
                "quicksight:DescribeAccountSubscription",
                "resource-explorer-2:*",
                "route53-recovery-cluster:*",
                "route53-recovery-control-config:*",
                "route53-recovery-readiness:*",
                "route53:*",
                "route53domains:*",
                "s3:CreateMultiRegionAccessPoint",
                "s3:DeleteMultiRegionAccessPoint",
                "s3:DescribeMultiRegionAccessPointOperation",
                "s3:GetAccountPublicAccessBlock",
                "s3:GetBucketLocation",
                "s3:GetBucketPolicy",
                "s3:GetBucketPolicyStatus",
                "s3:GetBucketPublicAccessBlock",
                "s3:GetMultiRegionAccessPoint",
                "s3:GetMultiRegionAccessPointPolicy",
                "s3:GetMultiRegionAccessPointPolicyStatus",
                "s3:GetStorageLensConfiguration",
                "s3:GetStorageLensDashboard",
                "s3:ListAllMyBuckets",
                "s3:ListMultiRegionAccessPoints",
                "s3:ListStorageLensConfigurations",
                "s3:PutAccountPublicAccessBlock",
                "s3:PutBucketPolicy",
                "s3:PutMultiRegionAccessPointPolicy",
                "savingsplans:*",
                "shield:*",
                "sso:*",
                "sts:*",
                "support:*",
                "supportapp:*",
                "supportplans:*",
                "sustainability:*",
                "tag:GetResources",
                "tax:*",
                "trustedadvisor:*",
                "vendor-insights:ListEntitledSecurityProfiles",
                "waf-regional:*",
                "waf:*",
                "wafv2:*",
                "wellarchitected:*"
            ],
            "Resource": "*",
            "Condition": {
                "StringNotEquals": {
                    "aws:RequestedRegion": ${jsonencode(allowed)}
                }
                %{ if length(exceptions) > 0 ~}
                ,"ArnNotLike": {
                    "aws:PrincipalARN": ${jsonencode(exceptions)}
                }
                %{ endif ~}
            }
        }
    ]
}
