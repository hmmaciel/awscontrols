resource "aws_lb_target_group" "target-group" {
  name     = "awscontrols"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.app-vpc.id
}

resource "aws_lb_target_group_attachment" "target-group-att" {
  target_group_arn = aws_lb_target_group.target-group.arn
  target_id        = aws_instance.virtual_machine.id
  port             = var.ec2_app_port
}