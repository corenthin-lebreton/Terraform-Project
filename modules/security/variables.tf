variable "ippublique" {
  description = "IP Publique autorisée à accéder à l'instance"
  type        = string
  default     = "93.19.66.4/32"
  
}

variable "vpc_id" {
  description = "ID du VPC"
  type        = string
}