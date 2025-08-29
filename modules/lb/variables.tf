variable "vpc_id" {
  description = "ID du VPC"
  type        = string
  
}

variable "publicsubnets" {
  description = "Liste des subnets publics"
  type        = list(string)
  
}

variable "appinstance" {
  type = list(string)
  description = "Liste des instances applicatives"
}

variable "SG-Web" {
  type = string
}