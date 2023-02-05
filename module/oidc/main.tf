locals {
  provider_url = "token.actions.githubusercontent.com"
  aws_policies = [
    "AmazonVPCFullAccess",
    "ElasticLoadBalancingFullAccess",
    "AmazonRoute53FullAccess",
    "AWSCertificateManagerFullAccess",
    "AmazonEC2FullAccess"
  ]
  policies = concat(var.policies, [for policy in data.aws_iam_policy.aws_managed : policy.arn])
}

data "aws_caller_identity" "current" {}
data "aws_iam_policy" "aws_managed" {
  count = length(local.aws_policies)

  name = local.aws_policies[count.index]
}

data "aws_iam_policy_document" "github_actions_trust" {
  statement {
    effect = "Allow"
    actions = [
      "sts:TagSession",
      "sts:AssumeRoleWithWebIdentity"
    ]

    principals {
      type        = "Federated"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/${local.provider_url}"]
    }

    condition {
      test     = "ForAllValues:StringEquals"
      variable = "${local.provider_url}:iss"
      values   = ["http://${local.provider_url}"]
    }

    condition {
      test     = "ForAllValues:StringEquals"
      variable = "${local.provider_url}:aud"
      values   = ["sts.amazonaws.com"]
    }

    condition {
      test     = "StringLike"
      variable = "${local.provider_url}:sub"
      values   = ["repo:${var.github_username}/${var.github_repository}:*"]
    }
  }
}

resource "aws_iam_role" "main" {
  name        = var.name
  description = "Assume role for Github OIDC Provider"

  assume_role_policy = data.aws_iam_policy_document.github_actions_trust.json
}

resource "aws_iam_role_policy_attachment" "main" {
  count = length(local.policies)

  role       = aws_iam_role.main.name
  policy_arn = local.policies[count.index]
}