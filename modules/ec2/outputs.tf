output "bastion_public_ip" {
    description = "The public IP address of the bastion host"
    value       = aws_instance.Bastion.public_ip
  
}

output "bastioninstance_id" {
    description = "The instance ID of the bastion host"
    value       = aws_instance.Bastion.id
}

output "appinstance_ips" {
    description = "The private IP addresses of the application servers"
    value       = aws_instance.AppServer[*].private_ip
}

output "appinstance_ids" {
    description = "The instance IDs of the application servers"
    value       = aws_instance.AppServer[*].id
}