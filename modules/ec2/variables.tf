variable "publicsubnet" {
    description = "Public Subnet ID"
    type        = list(string)
}

variable "privatesubnet" {
    description = "Private Subnet ID"
    type        = list(string)
}


variable "SG-Bastion" {
    description = "Security Group for Bastion Host"
    type        = string
}


variable "SG-App" {
    description = "Security Group for Application Servers"
    type        = string
}


variable "ami" {
    description = "AMI ID for EC2 instances"
    type        = string
}

variable "ssh-key" {
    description = "SSH Key Pair Name"
    type        = string
}