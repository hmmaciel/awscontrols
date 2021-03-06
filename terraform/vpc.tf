resource "aws_vpc" "app-vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "app-vpc"
  }
}

resource "aws_route" "igw-route" {
  route_table_id         = aws_vpc.app-vpc.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.app-vpc-gw.id
}

// Uncomment if you want an Elastic IP
/*
resource "aws_eip" "ip-app-vpc" {
  instance = aws_instance.virtual_machine.id
  vpc      = true
}
*/
