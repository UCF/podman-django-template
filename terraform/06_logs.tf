resource "aws_cloudwatch_log_group" "django-log-group" {
  name              = "/ecs/template"
  retention_in_days = var.log_retention_in_days
}

