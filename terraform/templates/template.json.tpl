[
  {
    "name": "template",
    "image": ${docker_image_url_django}",
    "essential" : true,
    "cpu": 10,
    "memory": 512,
    "portMappings": [
      {
        "containerPort":8000,
        "protocol": "tcp"
      }
    ],
    "command": ["python3", "manage.py", "runserver", "0.0.0.0:8000"],
    "environment": [],
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
        "awslogs-group": "/ecs/template",
        "awslogs-region": ${region},
        "awslogs-stream-prefix": "template-log-stream"
       }
    }
  }
]
