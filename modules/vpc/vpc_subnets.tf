resource "aws_vpc" "my-vpc" {
  cidr_block = var.myvpc_cidr_block
  tags = {
    Name = "my-vpc"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = var.public_subnet_cidr_block
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "Public Subnet"
  }
}

resource "aws_subnet" "private-subnet-1" {
  vpc_id            = aws_vpc.my-vpc.id
  cidr_block        = var.private_subnet1_cidr_block
  availability_zone = "us-east-1a"
  tags = {
    Name = "private-subnet-1"
  }
}

resource "aws_subnet" "private-subnet-2" {
  vpc_id            = aws_vpc.my-vpc.id
  cidr_block        = var.private_subnet2_cidr_block
  availability_zone = "us-east-1b"
  tags = {
    Name = "private-subnet-2"
  }
}