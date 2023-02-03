resource "aws_iam_policy" "tfstate_bucket" {
  name        = var.bucket_access_policy_name
  description = "Policy for tfstate bucket access"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow",
        Action = "s3:*",
        Resource = [
          "arn:aws:s3:::${aws_s3_bucket.main.id}",
          "arn:aws:s3:::${aws_s3_bucket.main.id}/*",
          "arn:aws:s3:::${aws_s3_bucket.logs.id}"
        ]
      }
    ]
  })
}

resource "aws_iam_policy" "tfstate_dynamodb" {
  name        = var.dynamodb_access_policy_name
  description = "Policy for tfstate dynamodb access"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "dynamodb:DescribeTable",
          "dynamodb:GetItem",
          "dynamodb:PutItem",
          "dynamodb:DeleteItem",
          "dynamodb:DescribeContinuousBackups",
          "dynamodb:DescribeTimeToLive",
          "dynamodb:ListTagsOfResource"
        ],
        Resource = "arn:aws:dynamodb:*:*:table/${aws_dynamodb_table.main.id}"
      }
    ]
  })
}

resource "aws_iam_policy" "read_poliy" {
  name        = var.read_policies_policy_name
  description = "Policy for resource policies"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "iam:GetPolicy",
          "iam:ListPolicies",
          "iam:GetPolicyVersion",
          "iam:ListRolePolicies",
          "iam:GetRole",
          "iam:ListAttachedRolePolicies"
        ],
        Resource = "*"
      }
    ]
  })
}