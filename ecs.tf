resource "aws_ecs_cluster" "medusa_cluster" {
  name = "medusa-cluster"
}

resource "aws_ecs_task_definition" "medusa_task" {
  family                   = "medusa-task"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "512"
  memory                   = "1024"
  network_mode             = "awsvpc"

  container_definitions = jsonencode([
    {
      name      = "medusa"
      image     = "${aws_ecr_repository.medusa_ecr.repository_url}:latest"
      memory    = 512
      cpu       = 256
      essential = true
      portMappings = [
        {
          containerPort = 9000
          hostPort      = 9000
        }
      ]
    }
  ])
}
