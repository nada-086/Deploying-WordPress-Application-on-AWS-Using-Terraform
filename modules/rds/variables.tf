variable "db_password" {
    description = "RDS root user password"
    type        = string
    sensitive   = true
}

variable "vpc_id" {}
variable "ec2_sg_id" {}
variable "private_subnet_1_id" {}
variable "private_subnet_2_id" {}