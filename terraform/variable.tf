variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_1" {
  description = "CIDR block for subnet 1"
  default     = "10.0.1.0/24"
}

variable "subnet_cidr_2" {
  description = "CIDR block for subnet 2"
  default     = "10.0.2.0/24"
}

variable "az_1" {
  description = "Availability Zone for subnet 1"
  default     = "us-east-1a"
}

variable "az_2" {
  description = "Availability Zone for subnet 2"
  default     = "us-east-1b"
}

variable "cluster_name" {
  description = "EKS Cluster Name"
  default     = "cuteblog-cluster"
}

variable "node_group_name" {
  description = "EKS Node Group Name"
  default     = "cuteblog-node-group"
}

variable "desired_size" {
  description = "Desired size for node group"
  default     = 2
}

variable "max_size" {
  description = "Maximum size for node group"
  default     = 3
}

variable "min_size" {
  description = "Minimum size for node group"
  default     = 1
}

variable "instance_types" {
  description = "Instance types for the worker nodes"
  default     = ["t3.medium"]
}

variable "ssh_cidr" {
  description = "CIDR block allowed for SSH access"
  type        = string
  default     = "0.0.0.0/0"  # Restrict to your IP in production
}

variable "ssh_key_name" {
  description = "Name of the EC2 key pair for SSH access"
  type        = string
  default     = ""  # Set to your key pair name (e.g., "my-key")
}
