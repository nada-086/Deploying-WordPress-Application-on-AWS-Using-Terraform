resource "aws_db_instance" "wordpress_db" {
    identifier             = "wordpress-db"
    instance_class         = "db.t3.micro"
    allocated_storage      = 10
    engine                 = "mysql"
    engine_version         = "8.0"
    username               = "wordpress"
    password               = var.db_password
    db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
    vpc_security_group_ids = [aws_security_group.rds_sg.id]
    parameter_group_name   = "default.mysql8.0"
    skip_final_snapshot    = true
}


# Subnet Group
resource "aws_db_subnet_group" "rds_subnet_group" {
    name       = "rds-subnet-group"
    subnet_ids = [var.private_subnet_1_id, var.private_subnet_2_id]

    tags = {
        Name = "RDS Subnet Group"
    }
}