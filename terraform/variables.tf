# Core

variable "region" {
  description = "The AWS region to create resources in."
  default     = "us-east-1"
}

# Network

variable "public_subnet_1_cidr" {
  description = "CIDR Block for Public Subnet 1"
  default     = "10.0.1.0/24"
}
variable "public_subnet_2_cidr" {
  description = "CIDR Block for Public Subnet 2"
  default     = "10.0.2.0/24"
}
variable "private_subnet_1_cidr" {
  description = "CIDR Block for Private Subnet 1"
  default     = "10.0.3.0/24"
}
variable "private_subnet_2_cidr" {
  description = "CIDR Block for Private Subnet 2"
  default     = "10.0.4.0/24"
}
variable "availability_zones" {
  description = "Availability zones"
  type        = list(string)
  default     = ["us-east-1b", "us-east-1c"]
}

# Load Balancer

variable "health_check_path" {
  description = "Health check path for the default target group"
  default     = "/ping/"
}

# ECS

variable "ecs_cluster_name" {
  description = "Name of the ECS cluster"
  default     = "development"
}

variable "docker_image_url_django" {
  description = "Docker image to run in the ECS cluster"
  default     = "public.ecr.aws/j2a5t6s3/template-web:latest"
}

variable "app_count" {
  description = "Number of containers to run"
  default     = 1
}

variable "fargate_cpu" {
  description = "Amount of CPU for Fargate task. E.g., '256' (.25 vCPU)"
  default     = "256"
}

variable "fargate_memory" {
  description = "Amount of memoey for Fargate task. E.g., '512' (0.5GB)"
  default     = "512"
}

# Logs

variable "log_retention_in_days" {
  default = 30
}

# ECS service auto scaling

variable "autoscale_min" {
  description = "Minimum autoscale (number of tasks)"
  default     = "10"
}

variable "autoscale_max" {
  description = "Maximum autoscale (number of tasks)"
  default     = "10"
}

variable "autoscale_desired" {
  description = "Desired number of tasks to run initially"
  default     = "4"
}

