output "vpc_id" {
    value = aws_vpc.my-vpc.id
}

output "public_subnet_1_id" {
    value = aws_subnet.subnet-1.id
}

output "public_subnet_2_id" {
    value = aws_subnet.subnet-2.id
}

output "private_subnet_1_id" {
    value = aws_subnet.private-subnet-1.id
}

output "private_subnet_2_id" {
    value = aws_subnet.private-subnet-2.id
}