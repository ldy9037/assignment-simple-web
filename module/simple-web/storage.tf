resource "aws_s3_bucket" "logs" {
  bucket = var.log_bucket
}

resource "aws_s3_bucket_acl" "logs_acl" {
  bucket = aws_s3_bucket.logs.id
  acl    = "private"
}

resource "aws_s3_bucket_policy" "alb_logging" {
  bucket = aws_s3_bucket.logs.id
  policy = data.aws_iam_policy_document.allow_access_alb.json
}