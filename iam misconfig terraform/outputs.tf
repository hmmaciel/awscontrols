output "access_key" {
  description = "IAM Test User Access Key"
  value       = aws_iam_access_key.billy.id
}

output "secret_key" {
  description = "IAM Test User Secret Key"
  value       = aws_iam_access_key.billy.secret
}