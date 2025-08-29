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