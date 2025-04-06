output "vpc_id" {
  value = aws_vpc.medusa_vpc.id
}

output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "rds_endpoint" {
  value = aws_db_instance.medusa_db.endpoint
}

output "ecr_repo_url" {
  value = aws_ecr_repository.medusa_ecr.repository_url
}

output "alb_dns_name" {
  value = aws_lb.medusa_alb.dns_name
}
