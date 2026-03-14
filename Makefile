COMPOSE	= ./srcs/docker-compose.yml
ENV		= ./secrets/.env

all: up

build:
	docker compose --env-file $(ENV) -f $(COMPOSE) build

up: build
	docker compose --env-file $(ENV) -f $(COMPOSE) up
	@echo "to open admin page type 127.0.0.1/wp-admin"

down:
	docker compose --env-file $(ENV) -f $(COMPOSE) down

clean: down
	sudo rm -rf /home/mikurek/data/db /home/mikurek/data/wp

restart: down all

re: clean all