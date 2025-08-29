resource "aws_db_subnet_group" "rdssubnetgroup" {
  name       = "ecoshop-db-subnet-group"
  subnet_ids = var.subnets

  tags = {
    Name        = "ecoshop-db-subnet-group"
  }
  
}

resource "aws_db_instance" "ecoshopdbinstance" {
  identifier     = "ecoshopdbinstance"
  instance_class = "db.t3.micro"
  engine         = "mysql"
  engine_version = "8.0"
  allocated_storage = 20
  storage_type = "gp2"
  multi_az = true
  db_name = "ecoshop"
  username  = var.db_username
  password  = var.db_password
  vpc_security_group_ids = [var.SG-DB]
  db_subnet_group_name = aws_db_subnet_group.rdssubnetgroup.name
  skip_final_snapshot = true

  tags = {
        Name = "ecoshop-rds-instance"
    }
}