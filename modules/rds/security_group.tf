
# Security Group
resource "aws_security_group" "rds_sg" {
    name        = "rds_sg"
    description = "Allow MySQL from EC2"
    vpc_id      = var.vpc_id

    ingress {
        from_port       = 3306
        to_port         = 3306
        protocol        = "tcp"
        description     = "MySQL Access from EC2 SG"
        security_groups = [var.ec2_sg_id]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "RDS_SG"
    }
}