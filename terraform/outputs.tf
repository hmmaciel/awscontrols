output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.virtual_machine.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.virtual_machine.public_ip
}