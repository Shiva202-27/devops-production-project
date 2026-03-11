resource "aws_instance" "web_server" {

  ami           = "ami-0f58b397bc5c1f2e8"
  instance_type = "t3.micro"

subnet_id = aws_subnet.private_subnet_1.id
  vpc_security_group_ids = [
    aws_security_group.ec2_sg.id
  ]

  tags = {
    Name = "devops-web-server"
  }

}