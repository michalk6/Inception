*This project has been created as part of the 42 curriculum by mikurek.*

# Inception

## Description

The goal of this project is to build a multi-container infrastructure using Docker. It demonstrates how to run a complete web stack composed of:

- an HTTP server (**NGINX**),
- a CMS application (**WordPress**),
- a database (**MariaDB**),

where each component runs in its own container and communicates through a dedicated Docker network.

The project focuses on:
- service isolation,
- container management,
- network configuration,
- security (environment variables vs secrets),
- data persistence (volumes).

---

## Project Architecture

The project uses **Docker Compose** to manage multiple containers.

### Services

- **NGINX**
  - web server
  - HTTPS support (TLS)
- **WordPress**
  - PHP application running on php-fpm
- **MariaDB**
  - database for WordPress

### Network

All containers are connected to a single, isolated Docker network, enabling secure communication between them.

---

## Technical Choices

### Virtual Machines vs Docker

| Virtual Machines | Docker |
|-----------------|--------|
| Full operating system | Shared host kernel |
| Heavyweight | Lightweight |
| Slower startup | Fast startup |
| Higher resource usage | Efficient resource usage |

Docker is very good choise in terms of efficiency and ease of management.

---

### Secrets vs Environment Variables

| Secrets | Environment Variables |
|--------|----------------------|
| Secure storage | Easy to use |
| Hidden from users | Visible in the system |
| Better for sensitive data | Good for configuration |

- environment variables are used for configuration.

---

### Docker Network vs Host Network

| Docker Network | Host Network |
|---------------|-------------|
| Container isolation | No isolation |
| Own address space | Shared with host |
| More secure | Less secure |

Docker Network is used for better isolation and traffic control.

---

### Docker Volumes vs Bind Mounts

| Docker Volumes | Bind Mounts |
|----------------|-------------|
| Managed by Docker | Direct host access |
| More secure | More flexible |
| Better for production | Better for development |

- volumes are used for persistent data (MariaDB, WordPress)

---

## Instructions

### Requirements

- Docker
- Docker Compose
- Make

### Run the project

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

## Resources

The following resources were mainly used during the development process:

- Docker Documentation: https://docs.docker.com/
- Docker Compose Documentation: https://docs.docker.com/compose/
- NGINX Documentation: https://nginx.org/en/docs/
- WordPress CLI Documentation: https://developer.wordpress.org/cli/
- MariaDB Documentation: https://mariadb.org/documentation/

## Use of AI Tools

AI tools were utilized to:
- clarify Docker-related concepts
- troubleshoot container networking issues
- enhance shell scripts
- verify implementation approaches

All code and configurations were carefully reviewed and tested manually.