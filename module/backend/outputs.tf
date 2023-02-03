output "dynamodb_policy_arn" {
  description = "IAM policy ARN for dynamoDB access"
  value       = aws_iam_policy.tfstate_dynamodb.arn
}

output "bucket_policy_arn" {
  description = "IAM policy ARN for s3 bucket access"
  value       = aws_iam_policy.tfstate_bucket.arn
}

output "resource_policies_policy_arn" {
  description = "IAM policy ARN for read to resource policies"
  value       = aws_iam_policy.read_poliy.arn
}