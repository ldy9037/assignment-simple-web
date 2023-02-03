output "dynamodb_policy_arn" {
  description = "IAM Policy ARN for DynamoDB Access"
  value       = aws_iam_policy.tfstate_dynamodb.arn
}

output "bucket_policy_arn" {
  description = "IAM Policy ARN for s3 bucket Access"
  value       = aws_iam_policy.tfstate_bucket.arn
}