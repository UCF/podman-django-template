#!/bin/sh

cd /app
python manage.py migrate
exec gunicorn --workers=2 --threads=4 --worker-class=gthread --bind '[::]:80' --worker-tmp-dir /dev/shm wsgi:application

