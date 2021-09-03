resource "aws_instance" "virtual_machine" {
  // AMI Code Ireland
  ami = "ami-063d4ab14480ac177"

  // AMI Code Frankfurt
  //ami = "ami-07df274a488ca9195"
  
  // Comment following line if using Elastic IP (found in network.tf file)
  associate_public_ip_address = true
  instance_type               = "t2.micro"
  key_name                    = "EC2Keypair"
  security_groups             = [aws_security_group.subnet-backend-sg.id]

  tags = {
    Name = var.instance_name
  }

  subnet_id            = aws_subnet.subnet-backend.id
  user_data            = file("./ec2-bootstrap.sh")
  iam_instance_profile = aws_iam_instance_profile.ssm_profile.id
}