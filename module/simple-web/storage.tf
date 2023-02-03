resource "aws_s3_bucket" "logs" {
  bucket = var.log_bucket
}

resource "aws_s3_bucket_acl" "logs_acl" {
  bucket = aws_s3_bucket.logs.id
  acl    = "log-delivery-write"
}