#!/bin/bash

# Wait for MySQL to become available
until podman exec podman-django-template-mysql-1 mysqladmin ping -h localhost -u myuser --password=mypassword > /dev/null 2>&1; do
    echo "MySQL is unavailable - sleeping"
    sleep 1
done

echo "MySQL is available - starting Django"
# Start Django application
python manage.py runserver 0.0.0.0:8000

