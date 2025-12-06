data "aws_vpc" "default" {
  default = true
}

resource "aws_security_group" "db_sg" {
  name   = "rds-sg"
  vpc_id = data.aws_vpc.default.id
}

resource "aws_db_instance" "db" {
  allocated_storage    = 20
  engine               = "postgres"
  engine_version       = "15"
  instance_class       = "db.t3.micro"
  name                 = "appdb"
  username             = "admin"
  password             = var.db_password
  skip_final_snapshot  = true
  publicly_accessible  = false
  vpc_security_group_ids = [aws_security_group.db_sg.id]
}
