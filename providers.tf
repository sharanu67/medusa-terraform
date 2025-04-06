terraform {
  required_version = ">= 1.0"
  backend "s3" {
    bucket = "medusa-terraform-state"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}
