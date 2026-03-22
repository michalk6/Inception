COMPOSE	= ./srcs/docker-compose.yml
ENV		= ./secrets/.env

all: up

dirs:
	set -a; . $(ENV); set +a; \
	mkdir -p $${DATA_DIR}/db $${DATA_DIR}/wp

build: dirs
	set -a; . $(ENV); set +a; \
	docker compose --env-file $(ENV) -f $(COMPOSE) build

up: build
	docker compose --env-file $(ENV) -f $(COMPOSE) up
	@echo "to open admin page type 127.0.0.1/wp-admin"

down:
	docker compose --env-file $(ENV) -f $(COMPOSE) down

clean: down
	set -a; . $(ENV); set +a; \
	sudo rm -rf $${DATA_DIR}/db $${DATA_DIR}/wp

restart: down all

re: clean all