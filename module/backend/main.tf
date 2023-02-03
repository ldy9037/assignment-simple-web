resource "aws_dynamodb_table" "main" {
  name           = var.state_lock_table_name
  billing_mode   = "PROVISIONED"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

resource "aws_s3_bucket" "main" {
  bucket = var.tfstate_bucket
}

resource "aws_s3_bucket_logging" "main_logging" {
  bucket = aws_s3_bucket.main.id

  target_bucket = aws_s3_bucket.logs.id
  target_prefix = var.log_key_prefix
}

resource "aws_s3_bucket_acl" "main_acl" {
  bucket = aws_s3_bucket.main.id
  acl    = "private"
}

resource "aws_s3_bucket" "logs" {
  bucket = var.log_bucket
}

resource "aws_s3_bucket_acl" "logs_acl" {
  bucket = aws_s3_bucket.logs.id
  acl    = "log-delivery-write"
}