# Create a security group allowing SSH and HTTP/S
resource "aws_security_group" "allow_http" {
    name        = "allow_http"
    description = "Allow HTTP, HTTPS, MySQL and SSH"
    vpc_id      = var.vpc_id  # Attached to the custom VPC
    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]  
    }
    
    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]  
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}