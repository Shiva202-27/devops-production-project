resource "aws_db_subnet_group" "db_subnet" {

  name = "devops-db-subnet-group"

  subnet_ids = [
    aws_subnet.private_subnet_1.id,
    aws_subnet.private_subnet_2.id
  ]

  tags = {
    Name = "db-subnet-group"
  }

}
resource "aws_security_group" "rds_sg" {

  name   = "rds-security-group"
  vpc_id = aws_vpc.main_vpc.id

  ingress {

    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"

    security_groups = [
      aws_security_group.ec2_sg.id
    ]

  }

  egress {

    from_port   = 0
    to_port     = 0
    protocol    = "-1"

    cidr_blocks = ["0.0.0.0/0"]

  }

}
resource "aws_db_instance" "mysql_db" {

  identifier = "devops-project-db"

  engine = "mysql"

  instance_class = "db.t3.micro"

  allocated_storage = 20

  username = "admin"
  password = "StrongPassword123"

  db_subnet_group_name = aws_db_subnet_group.db_subnet.name

  vpc_security_group_ids = [
    aws_security_group.rds_sg.id
  ]

  skip_final_snapshot = true

}