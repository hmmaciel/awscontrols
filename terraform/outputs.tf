output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.virtual_machine.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.virtual_machine.public_ip
}

output "userpool_id" {
  description = "Cognito User Pool ID"
  value       = aws_cognito_user_pool.pool.id
}

output "userpool_client_id" {
  description = "Cognito User Pool Client ID"
  value       = aws_cognito_user_pool_client.client.id
}

output "route53_url" {
  description = "Route 53 URL"
  value       = aws_route53_record.www.name
}