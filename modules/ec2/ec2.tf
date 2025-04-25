# Launch the EC2 instance
resource "aws_instance" "MyEC2" {
    ami                    = var.ami
    instance_type          = var.instance_type
    key_name               = aws_key_pair.mykey.key_name  
    vpc_security_group_ids = [aws_security_group.allow_http.id]
    subnet_id              = var.public_subnet_id

    tags = {
        Name = "MyEC2Instance"
    }
}