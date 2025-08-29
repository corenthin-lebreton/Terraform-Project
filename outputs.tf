# -------------------------- Outputs VPC ------------------------- #

output "vpc_id" {
  description = "ID du VPC"
  value       = module.vpc-ecoshop.vpc_id
}

output "public_subnets" {
  description = "Liste des subnets publics"
  value       = module.vpc-ecoshop.public_subnets
}

output "private_app_subnets" {
  description = "Liste des subnets privés App"
  value       = module.vpc-ecoshop.private_app_subnets
}

output "db_subnets" {
  description = "Liste des subnets privés DB"
  value       = module.vpc-ecoshop.db_subnets
}


# ----------------------- Outputs Security ----------------------- #

output "sg_bastion_id" {
  description = "ID du SG Bastion"
  value       = module.security.sg_bastion_id
}

output "sg_web_id" {
  description = "ID du SG Web"
  value       = module.security.sg_web_id
}

output "sg_app_id" {
  description = "ID du SG App"
  value       = module.security.sg_app_id
}

output "sg_db_id" {
  description = "ID du SG DB"
  value       = module.security.sg_db_id
}

# ------------------------- Outputs EC2 ------------------------- #

output "bastion_public_ip" {
  description = "The public IP address of the bastion host"
  value       = module.ec2.bastion_public_ip
}

output "bastioninstance_id" {
  description = "The instance ID of the bastion host"
  value       = module.ec2.bastioninstance_id
}

output "appinstance_ips" {
  description = "The private IP addresses of the application servers"
  value       = module.ec2.appinstance_ips
}

output "appinstance_ids" {
  description = "The instance IDs of the application servers"
  value       = module.ec2.appinstance_ids
}

# --------------------------------------------------------------- #


# ------------------------- Outputs RDS ------------------------- #
output "db_endpoint" {
  description = "Endpoint de la base RDS"
  value       = module.rds.db_endpoint
}

output "db_instance_id" {
  description = "ID de l'instance RDS"
  value       = module.rds.db_instance_id
}

# --------------------------------------------------------------- #