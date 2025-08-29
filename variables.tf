variable "aws_region" {
  description = "Région AWS"
  type        = string
  default     = "us-east-1"
}


variable "vpc_cidr" {
  description = "CIDR du VPC"
  type        = string

}


variable "az1" {
  description = "AZ1"
  type        = string

}

variable "az2" {
  description = "AZ2"
  type        = string
}


variable "publicwebtier" {
  description = "premier subnet public"
}
variable "publicwebtier2" {
  description = "deuxième subnet public"
}
variable "privateapp1" {
  description = "premier subnet privé pour les instances"
}
variable "privateapp2" {
  description = "deuxième subnet privé pour les instances"
}
variable "privatedb1" {
  description = "premier subnet privé pour la base de données"
}
variable "privatedb2" {
  description = "deuxième subnet privé pour la base de données"
}




variable "db_username" {
  description = "The username for the RDS database"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "The password for the RDS database"
  type        = string
  sensitive   = true
}


