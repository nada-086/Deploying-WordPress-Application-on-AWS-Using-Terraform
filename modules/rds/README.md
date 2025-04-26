# 🧱 What is This?
This Terraform module sets up a MySQL database on AWS RDS that can be used by a WordPress site. It’s a part of an infrastructure-as-code (IaC) approach where you define your infrastructure in configuration files.

This specific module does two main things:

1. Creates a MySQL RDS instance, which is a managed database provided by AWS.

2. Creates a subnet group for the RDS instance, which ensures it is placed in private subnets for better security.

## 🧩 Terraform Resources Explained

### 1. `aws_db_instance` – The Database

```hcl
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
```
This resource creates a MySQL RDS instance for WordPress. Here's what each argument does:

- identifier: Sets the name of the DB instance (wordpress-db).

- instance_class: Defines the size of the instance (db.t3.micro – small and cost-effective).
 
- allocated_storage: Sets storage size (10 GB in this case).
 
- engine / engine_version: Specifies MySQL version 8.0.

- username / password: Database credentials (password passed securely as a variable).
 
- db_subnet_group_name: Associates the DB with a subnet group (defined below).

- vpc_security_group_ids: Adds security by restricting traffic to the DB via a security group.

- parameter_group_name: Uses the default parameter group for MySQL 8.0.

- skip_final_snapshot: Prevents final snapshot when destroying the DB (good for development, risky in production).

### 2. aws_db_subnet_group – The Subnet Group
```hcl
resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = [var.private_subnet_1_id, var.private_subnet_2_id]

  tags = {
    Name = "RDS Subnet Group"
  }
}
```

This resource defines a DB subnet group, which controls which subnets your RDS instance can be deployed in.

- name: The name of the subnet group.

- subnet_ids: A list of private subnet IDs for placing the DB in private networking zones.

- tags: Optional tags for identification and management.