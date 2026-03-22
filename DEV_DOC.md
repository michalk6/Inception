# Developer Documentation

## Prerequisites

-   Docker
-   Docker Compose
-   Make

---

## Project Setup

Clone repository and configure `.env`.

---

## Environment Configuration

Variables: 
USER
DATA_DIR

WORDPRESS_DB_NAME
WORDPRESS_DB_USER
WORDPRESS_DB_PASSWORD
WORDPRESS_DB_PORT
WORDPRESS_DB_HOST

WORDPRESS_URL
WORDPRESS_TITLE

WORDPRESS_ADMIN
WORDPRESS_ADMIN_PASSWORD
WORDPRESS_ADMIN_EMAIL

WORDPRESS_USER
WORDPRESS_USER_PASSWORD
WORDPRESS_USER_EMAIL

---

## Build project

by Make: 
- `make build`

By docker compose:
- make directories for volumes and set up environment variables
- `docker compose build`

---

## Run
by Make:
`make`

By docker compose:
`docker compose up`

---

## Managing Containers

docker ps 
docker exec -it <container_name> sh

---

## Volumes & Persistence

Data stored in:

/home/login/data

Volumes: - db - wp