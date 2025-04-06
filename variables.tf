variable "region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR for public subnet"
  default     = "10.0.1.0/24"
}

variable "db_username" {
  default = "medusa_admin"
}

variable "db_password" {
  default = "SuperSecretPassword123"
}

variable "db_allocated_storage" {
  default = 20
}
