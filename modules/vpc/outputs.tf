output "vpc_id" {
  description = "ID du VPC"
  value       = aws_vpc.vpc-ecoshop.id
}

output "public_subnets" {
  description = "Liste des subnets publics"
  value       = [aws_subnet.publicwebtier.id, aws_subnet.publicwebtier2.id]
}

output "private_app_subnets" {
  description = "Liste des subnets privés App"
  value       = [aws_subnet.privateapp1.id, aws_subnet.privateapp2.id]
}

output "db_subnets" {
  description = "Liste des subnets privés DB"
  value       = [aws_subnet.privatedb1.id, aws_subnet.privatedb2.id]
}