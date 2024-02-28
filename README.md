# Podman-Django-MySQL Hello World!

## A Hello World Django web application connected to a MySQL database containerized in podman and composed with podman-compose

### First: pull this repository.

`git clone https://github.com/ucfchandra/django-mysql-podman-helloworld.git`

### Second: ensure Podman is installed. Install podman-compose as well.

For Podman:
https://podman.io/docs/installation

For podman-compose:

https://github.com/containers/podman-compose

### Third, ensure the podman machine is initialized and running. Use these two commands:

`podman machine init`

`podman machine start`

### Fourth, ensure your architecture matches the architecture of the base image in the Contianerfiles. Uncomment the correct Containerfile architecture for your use case

### Finally: run the podman compose up command from the directory holding this repository. 

`podman compose up`

### Test that the application works by going to localhost:8004



## Troubleshooting

If the `podman compose up` command does not work, check that you are in the directory with the podman-compose.yml file

If the `podman compose up` function says it can't find the file, ensure you have podman-compose installed and not docker-compose. If you have docker-compose running underneath `podman compose up`, then use the following command:

`podman compose -f podman-compose.yml up`

Ensure your architecture matches the architecture provided for the base images in the Containerfiles (e.g., if you're running Mac M-series, you need the aarch64 python image not the default one)

If it says that the port is already in use, kill the process running on the port or change the port in the podman-compose.yml file
