variable "subnets" {
    description = "List of subnet IDs for the RDS instances."
    type        = list(string)
}

variable "vpc_id" {
    description = "The VPC ID where the RDS instances will be deployed."
    type        = string
}

variable "SG-DB" {
    description = "Security Group ID for the RDS instances."
    type        = string
}

variable "db_username" {
    description = "The username for the RDS database."
    type        = string
    sensitive = true
} 

variable "db_password" {
    description = "The password for the RDS database."
    type        = string
    sensitive = true
  
}