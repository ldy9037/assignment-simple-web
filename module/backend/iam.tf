resource "aws_iam_policy" "tfstate_bucket" {
  name        = var.bucket_access_policy_name
  description = "Policy for tfstate bucket access"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow",
        Action   = "s3:ListBucket",
        Resource = "arn:aws:s3:::${aws_s3_bucket.main.id}"
      },
      {
        Effect = "Allow",
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject"
        ],
        Resource = "arn:aws:s3:::${aws_s3_bucket.main.id}/${var.tfstate_key}"
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
          "dynamodb:DescribeContinuousBackups"
        ],
        Resource = "arn:aws:dynamodb:*:*:table/${aws_dynamodb_table.main.id}"
      }
    ]
  })
}