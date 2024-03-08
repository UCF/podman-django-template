# Podman-Django-MySQL Template

## A Template Django web application connected to a MySQL database containerized in podman and composed with podman-compose. The Django documentation's tutorial application is included as an example. Soon to include Odo support for local development. 

### First:
Pull this repository.

`git clone https://github.com/ucfchandra/django-mysql-podman-helloworld.git`

### Second:
Ensure Podman is installed. Install podman-compose as well.

For Podman:
https://podman.io/docs/installation

For podman-compose:
https://github.com/containers/podman-compose

### Third:
Ensure the podman machine is initialized and running. Use these two commands:

`podman machine init`

`podman machine start`

### Fourth:
Ensure your architecture matches the architecture of the base image in the Containerfiles. Uncomment the correct Containerfile architecture for your use case

### Fifth:
Run the `podman compose build` command from the directory holding this repository. 

`podman compose build`

### Finally:
Run the `podman compose up` command from the directory holding this repository.

`podman compose up`

### Test that the application works by going to localhost:8004

## Troubleshooting

If the podman compose up command hangs after the database container is spun up for more than 10 seconds, cancel it [press Ctrl+C]. Redo the command. 

If the `podman compose up` command does not work, check that you are in the directory with the podman-compose.yml file

If the `podman compose up` function says it can't find the file, ensure you have podman-compose installed and not docker-compose. If you have docker-compose running underneath `podman compose up`, then use the following command:

`podman compose -f podman-compose.yml up`

Ensure your architecture matches the architecture provided for the base images in the Containerfiles (e.g., if you're running Mac M-series, you need the aarch64 python image not the default one)

