resource "aws_launch_template" "web_template" {

  name_prefix = "devops-launch-template"

  image_id = "ami-0f58b397bc5c1f2e8"

  instance_type = "t3.micro"

  vpc_security_group_ids = [
    aws_security_group.ec2_sg.id
  ]

  tag_specifications {

    resource_type = "instance"

    tags = {
      Name = "devops-web-instance"
    }

  }

}