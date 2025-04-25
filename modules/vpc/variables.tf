variable "region" {
    description = "AWS region to deploy resources in"
    type        = string
}

variable "myvpc_cidr_block" {
    description = "CIDR block for my VPC"
    type        = string
}

variable "public_subnet_cidr_block" {
    description = "CIDR block for public subnet"
    type        = string
}

variable "private_subnet1_cidr_block" {
    description = "CIDR block for private subnet 1"
    type        = string
}

variable "private_subnet2_cidr_block" {
    description = "CIDR block for private subnet 2"
    type        = string
}
