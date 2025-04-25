resource "aws_internet_gateway" "my-igw" {
    vpc_id = aws_vpc.my-vpc.id
    tags = {
        Name = "my-igw"
    }
}

resource "aws_route_table" "my-route-table" {
    vpc_id = aws_vpc.my-vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.my-igw.id
    }
    tags = {
        Name = "my_route_table"
    }
}

resource "aws_route_table_association" "rt-subnet-association" {
    subnet_id      = aws_subnet.subnet-1.id
    route_table_id = aws_route_table.my-route-table.id
}

resource "aws_route_table_association" "rt-subnet-association2" {
    subnet_id      = aws_subnet.subnet-2.id
    route_table_id = aws_route_table.my-route-table.id
}