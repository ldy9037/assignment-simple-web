data "aws_caller_identity" "current" {}
data "aws_elb_service_account" "main" {
  region = var.region
}

resource "aws_iam_policy" "log_bucket" {
  name        = var.log_bucket_access_policy_name
  description = "Policy for log bucket access"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow",
        Action = "s3:*",
        Resource = [
          "arn:aws:s3:::${aws_s3_bucket.logs.id}"
        ]
      }
    ]
  })
}

data "aws_iam_policy_document" "allow_access_alb" {
  statement {
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = [data.aws_elb_service_account.main.arn]
    }

    actions = [
      "s3:PutObject"
    ]

    resources = [
      "arn:aws:s3:::${aws_s3_bucket.logs.id}/alb/${var.alb_name}/AWSLogs/${data.aws_caller_identity.current.id}/*",
    ]
  }
}