# Backend Subnet
resource "aws_subnet" "subnet-backend" {
  cidr_block        = var.subnet_backend_range
  vpc_id            = aws_vpc.app-vpc.id
  availability_zone = "eu-west-1b"
  //map_public_ip_on_launch = true
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

resource "aws_subnet" "subnet-2" {
  cidr_block        = "10.0.2.0/24"
  vpc_id            = aws_vpc.app-vpc.id
  availability_zone = "eu-west-1a"
  //map_public_ip_on_launch = true
}

resource "aws_route_table_association" "subnet-association-2" {
  subnet_id      = aws_subnet.subnet-2.id
  route_table_id = aws_route_table.vpc-route-table.id
}