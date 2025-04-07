provider "aws" {
  region = var.region  # Use the region from variables.tf
}

# Create ECS Cluster (Fargate does not need EC2 instances)
resource "aws_ecs_cluster" "cuteblog_cluster" {
  name = "cuteblog-cluster"
}

# IAM Role for Fargate Task Execution
resource "aws_iam_role" "ecs_execution_role" {
  name = "ecs-task-execution-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action    = "sts:AssumeRole"
      Principal = {
        Service = "ecs-tasks.amazonaws.com"
      }
      Effect    = "Allow"
      Sid       = ""
    }]
  })
}

# Fargate Task Definition (Defines container)
resource "aws_ecs_task_definition" "cuteblog_task" {
  family                   = "cuteblog-task"
  execution_role_arn       = aws_iam_role.ecs_execution_role.arn
  task_role_arn            = aws_iam_role.ecs_execution_role.arn
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = var.cpu   # Use the CPU from variables.tf
  memory                   = var.memory   # Use the memory from variables.tf

  container_definitions = jsonencode([{
    name      = "cuteblog-container"
    image     = var.ecr_image_url  # Use the ECR image URL from variables.tf
    essential = true
    portMappings = [
      {
        containerPort = 5000
        hostPort      = 5000
        protocol      = "tcp"
      }
    ]
  }])
}

# ECS Service to run the Task
resource "aws_ecs_service" "cuteblog_service" {
  name            = "cuteblog-service"
  cluster         = aws_ecs_cluster.cuteblog_cluster.id
  task_definition = aws_ecs_task_definition.cuteblog_task.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = var.subnets  # Use the subnets from variables.tf
    assign_public_ip = true
  }
}

