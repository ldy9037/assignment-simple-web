resource "aws_dynamodb_table" "tfstate_lock" {
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