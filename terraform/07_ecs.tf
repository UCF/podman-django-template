resource "aws_ecs_cluster" "development" {
  name = "${var.ecs_cluster_name}-cluster"
}

data "template_file" "app" {
  template = file("templates/template.json.tpl")

  vars = {
    docker_image_url_django = var.docker_image_url_django
    region = var.region
  }
}

resource "aws_ecs_task_definition" "template" {
  family = "development"
  network_mode = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu = "${var.fargate_cpu}"
  memory = "${var.fargate_memory}"
  execution_role_arn = aws_iam_role.ecs-task-execution-role.arn
  task_role_arn = aws_iam_role.ecs-task-execution-role.arn
  container_definitions = data.template_file.app.rendered
}

resource "aws_ecs_service" "template" {
  name = "${var.ecs_cluster_name}-service"
  cluster = aws_ecs_cluster.development.id
  task_definition = aws_ecs_task_definition.template.arn
  launch_type = "FARGATE"
  desired_count = var.app_count
  network_configuration {
    subnets = [aws_subnet.public-subnet-1.id, aws_subnet.public-subnet-2.id]
    security_groups = [aws_security_group.ecs-fargate.id]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_alb_target_group.default-target-group.arn
    container_name = "template-web"
    container_port = 8000
  }
}
