output "db_endpoint" {
  description = "Endpoint de la base RDS"
  value       = aws_db_instance.ecoshopdbinstance.endpoint
}
output "db_instance_id" {
  description = "ID de l'instance RDS"
  value       = aws_db_instance.ecoshopdbinstance.id
}