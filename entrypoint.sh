#!/bin/sh

cd /app/mysite
python manage.py migrate
exec gunicorn --workers=2 --threads=4 --worker-class=gthread --bind '[::]:80' --worker-tmp-dir /dev/shm wsgi:application

