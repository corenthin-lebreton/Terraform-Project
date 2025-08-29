resource "aws_instance" "Bastion" {
    ami = var.ami
    instance_type = "t3.micro"
    subnet_id = var.publicsubnet[0]
    key_name = var.ssh-key
    vpc_security_group_ids = [var.SG-Bastion]
    tags = {
        Name = "ecoshop-bastion"
        Role = "bastion"
    }
}


resource "aws_instance" "AppServer" {
    ami = var.ami
    instance_type = "t3.small"
    count = length(var.privatesubnet)
    subnet_id = element(var.privatesubnet, count.index)
    key_name = var.ssh-key
    vpc_security_group_ids = [var.SG-App]

    user_data = file("${path.module}/script/userdata.sh")

    tags = {
        Name = "ecoshop-app-${count.index + 1}"
        Role = "app-server"
    }
}