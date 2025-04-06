module "vpc" {
  source = "./vpc"
}

module "rds" {
  source = "./rds"
}

module "ecr" {
  source = "./ecr"
}

module "ecs" {
  source = "./ecs"
}

module "alb" {
  source = "./alb"
}

module "iam" {
  source = "./iam"
}
