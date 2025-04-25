variable "ami" {
    default = "ami-084568db4383264d4"  # Ubuntu 20.04 in us-east-1
}

variable "instance_type" {
    default = "t2.micro"
}

variable "public_subnet_id" {}
variable "vpc_id" {}

# Output the public IP for SSH access
output "instance_ip" {
    value = aws_instance.MyEC2.public_ip
}

output "ec2_sg_id" {
    value = aws_security_group.allow_http.id
}