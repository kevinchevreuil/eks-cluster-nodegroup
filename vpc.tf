#Create a VPC ressource#
resource "aws_vpc" "kaisen-vpc" {
  cidr_block       = "10.2.0.0/16"
  instance_tenancy = "default"
  tags = {
    "Name" = "vpc-kaisen"
  }
}

#Create an internet gateway ressource#
resource "aws_internet_gateway" "kaisen-ig" {
  vpc_id = aws_vpc.kaisen-vpc.id
  tags = {
    "Name" = "kaisen-internet-gateway"
  }
}

#Create a route table ressource#
resource "aws_route_table" "kaisen-rt" {
  vpc_id = aws_vpc.kaisen-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.kaisen-ig.id
  }
  tags = {
    "Name" = "kaisen-route-table"
  }
}

#Create a VPC subnet ressource#
resource "aws_subnet" "kaisen-subnet-a" {
  vpc_id            = aws_vpc.kaisen-vpc.id
  cidr_block        = "10.2.1.0/24"
  availability_zone = "${var.aws_region}a"
  map_public_ip_on_launch = true
  tags = {
    "Name" = "kaisen-subnet-a"
  }
}

#Create a route table association ressource#
resource "aws_route_table_association" "kaisen-rta-a" {
  subnet_id      = aws_subnet.kaisen-subnet-a.id
  route_table_id = aws_route_table.kaisen-rt.id
}

#Create a VPC subnet ressource#
resource "aws_subnet" "kaisen-subnet-b" {
  vpc_id            = aws_vpc.kaisen-vpc.id
  cidr_block        = "10.2.2.0/24"
  availability_zone = "${var.aws_region}b"
  map_public_ip_on_launch = true
  tags = {
    "Name" = "kaisen-subnet-b"
  }
}

#Create a route table association ressource#
resource "aws_route_table_association" "kaisen-rta-b" {
  subnet_id      = aws_subnet.kaisen-subnet-b.id
  route_table_id = aws_route_table.kaisen-rt.id
}

#Create a VPC subnet ressource#
resource "aws_subnet" "kaisen-subnet-c" {
  vpc_id            = aws_vpc.kaisen-vpc.id
  cidr_block        = "10.2.3.0/24"
  availability_zone = "${var.aws_region}c"
  map_public_ip_on_launch = true
  tags = {
    "Name" = "kaisen-subnet-c"
  }
}

#Create a route table association ressource#
resource "aws_route_table_association" "kaisen-rta-c" {
  subnet_id      = aws_subnet.kaisen-subnet-c.id
  route_table_id = aws_route_table.kaisen-rt.id
}
