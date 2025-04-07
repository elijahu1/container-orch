variable "region" {
  description = "AWS region to deploy resources in"
  default     = "us-east-1"
}

variable "subnets" {
  description = "List of subnet IDs for ECS service"
  type        = list(string)
  default     = ["0.0.0.0/0"]  # Using any subnet for this example (adjust for production environments)
}

variable "cpu" {
  description = "The CPU allocation for the task"
  default     = "256"  # Adjust as needed
}

variable "memory" {
  description = "The memory allocation for the task"
  default     = "512"  # Adjust as needed
}

variable "ecr_image_url" {
  description = "The URL of the Docker image in ECR"
  type        = string
  default     = "279538561166.dkr.ecr.us-east-1.amazonaws.com/elijahu/cuteblog-flask-image"  # This will be provided dynamically via GitHub Secrets
}

