output "log_bucket_policy_arn" {
  description = "IAM policy ARN for s3 log bucket access"
  value       = aws_iam_policy.log_bucket.arn
}