# Backend Subnet
resource "aws_subnet" "subnet-backend" {
  cidr_block = var.subnet_backend_range
  vpc_id     = aws_vpc.app-vpc.id
}

resource "aws_route_table" "vpc-route-table" {
  vpc_id = aws_vpc.app-vpc.id

  route {
    cidr_block = var.allowed_ips
    gateway_id = aws_internet_gateway.app-vpc-gw.id
  }

  tags = {
    Name = "subnet-backend-route-table"
  }
}

resource "aws_route_table_association" "subnet-association" {
  subnet_id      = aws_subnet.subnet-backend.id
  route_table_id = aws_route_table.vpc-route-table.id
}