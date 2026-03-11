resource "aws_lb" "app_lb" {

  name               = "devops-alb"
  internal           = false
  load_balancer_type = "application"

  subnets = [
    aws_subnet.public_subnet_1.id,
    aws_subnet.public_subnet_2.id
  ]

  security_groups = [
    aws_security_group.alb_sg.id
  ]

}