resource "aws_vpc" "vpc-ecoshop" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    "Name" = "ecoshop-vpc"
  }
}

resource "aws_internet_gateway" "igwecoshop" {
  vpc_id = aws_vpc.vpc-ecoshop.id
  tags = { 
    Name = "ecoshop-igw" 
  }
}

resource "aws_subnet" "publicwebtier" {
  vpc_id                  = aws_vpc.vpc-ecoshop.id
  cidr_block              = var.publicwebtier
  availability_zone       = var.az1
  map_public_ip_on_launch = true
  tags = { Name = "publicwebtier" }
}

resource "aws_subnet" "publicwebtier2" {
  vpc_id                  = aws_vpc.vpc-ecoshop.id
  cidr_block              = var.publicwebtier2
  availability_zone       = var.az2
  map_public_ip_on_launch = true
  tags = { Name = "publicwebtier2" }
}


resource "aws_subnet" "privateapp1" {
  vpc_id            = aws_vpc.vpc-ecoshop.id
  cidr_block        = var.privateapp1
  availability_zone = var.az1
  tags = { Name = "privateapp1" }
}

resource "aws_subnet" "privateapp2" {
  vpc_id            = aws_vpc.vpc-ecoshop.id
  cidr_block        = var.privateapp2
  availability_zone = var.az2
  tags = { Name = "privateapp2" }
}


resource "aws_subnet" "privatedb1" {
  vpc_id            = aws_vpc.vpc-ecoshop.id
  cidr_block        = var.privatedb1
  availability_zone = var.az1
  tags = { Name = "privatedb1" }
}

resource "aws_subnet" "privatedb2" {
  vpc_id            = aws_vpc.vpc-ecoshop.id
  cidr_block        = var.privatedb2
  availability_zone = var.az2
  tags = { Name = "privatedb2" }
}


resource "aws_eip" "natecoshop" {
  domain = "vpc"
  tags = {
    "Name" = "ecoshop-nat" 
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.natecoshop.id
  subnet_id     = aws_subnet.publicwebtier.id
  tags = {
    Name = "ecoshop-nat"
  }

  depends_on = [aws_internet_gateway.igwecoshop]
}


resource "aws_route_table" "publicecoshop" {
  vpc_id = aws_vpc.vpc-ecoshop.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igwecoshop.id
  }

  tags = {
    Name = "ecoshop-rt-public"
  }
}

resource "aws_route_table_association" "publicwebtier-rttable" {
  subnet_id      = aws_subnet.publicwebtier.id
  route_table_id = aws_route_table.publicecoshop.id
}

resource "aws_route_table_association" "publicwebtier2-rttable" {
  subnet_id      = aws_subnet.publicwebtier2.id
  route_table_id = aws_route_table.publicecoshop.id
}


resource "aws_route_table" "private" {
  vpc_id = aws_vpc.vpc-ecoshop.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = "ecoshop-rt-private"
  }
}


resource "aws_route_table_association" "privateapp1-rt" {
  subnet_id      = aws_subnet.privateapp1.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "privateapp2-rt" {
  subnet_id      = aws_subnet.privateapp2.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "privatedb1-rt" {
  subnet_id      = aws_subnet.privatedb1.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "privatedb2-rt" {
  subnet_id      = aws_subnet.privatedb2.id
  route_table_id = aws_route_table.private.id
}