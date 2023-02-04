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