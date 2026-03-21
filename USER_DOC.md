# User Documentation

## Services Overview

This project provides a complete web stack composed of:

- **NGINX** – handles HTTPS  
- **WordPress** – the website (content management system)  
- **MariaDB** – database used by WordPress  

All services run in separate Docker containers and communicate through a Docker network.

## Starting the Project

The Makefile simplifies managing the Docker environment by wrapping common `docker compose` commands and handling environment variables and data directories.

Commands

- `make` / `make all`  
  Build and start all containers.

- `make build`  
  Build Docker images and create required data directories (`db`, `wp`).

- `make up`  
  Start containers and display the WordPress admin URL (`127.0.0.1/wp-admin`).

- `make down`  
  Stop and remove containers.

- `make clean`  
  Stop containers and delete all data directories (**removes database and WordPress data**).

- `make restart`  
  Restart the project.

- `make re`  
  Full reset: clean everything and rebuild from scratch.


## Accessing the Website

Open in browser:

https://mikurek.42.fr

## Accessing Admin Panel

https://mikurek.42.fr/wp-admin


## Credentials

Use credentials defined in `.env` file.

## Checking Services

docker ps docker compose logs -f


## Verifying NGINX (HTTPS only)

Commands used to verify that NGINX is accessible only through port 443.

curl -I http://localhost curl -kI https://localhost

nc -zv localhost 80 nc -zv localhost 443


## Verifying Database

Enter MariaDB container:  
docker exec -it mariadb sh

Login to database:  
mariadb -u root -p

Check database structure:  
SHOW DATABASES;  
USE <db_name> - enters desired databese;  
SHOW TABLES;  

Verify WordPress users:  
SELECT * FROM wp_users;

## Checking ports

Enter container: docker exec -it <container_name> sh  
Check listening sockets: netstat -tuln  
You can also check connection by: nc -zv <container_name> <container_port>  