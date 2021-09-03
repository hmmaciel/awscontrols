# Backend Security Group
resource "aws_security_group" "subnet-backend-sg" {
  name   = "ec2-sg"
  vpc_id = aws_vpc.app-vpc.id

  # Allow SSH traffic from any source
  ingress {
    cidr_blocks = [
      var.allowed_ips
    ]
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
  }

  # Allow Tomcat port communication
  ingress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]
    from_port   = 5006
    to_port     = 5006
    protocol    = "tcp"
    description = "HTTP"
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "alb-sg" {
  name   = "alb security group"
  vpc_id = aws_vpc.app-vpc.id

  # Allow HTTP traffic from any source
  ingress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    description = "HTTP"
  }

  # Allow HTTPS traffic from any source
  ingress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    description = "HTTPS"
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}