resource "aws_db_instance" "medusa_db" {
  allocated_storage    = 20
  engine              = "postgres"
  instance_class      = "db.t3.micro"
  username           = "medusa_admin"
  password           = "SuperSecretPassword123"
  skip_final_snapshot = true
}
