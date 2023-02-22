FILESRCS := srcs
NAME := $(addprefix $(FILESRCS)/,docker-compose.yml)
VOLUME := /home/ajossera/data/wordpress /home/ajossera/data/mariadb

all : build up

build:
	mkdir -p $(VOLUME)
	docker-compose -f $(NAME) build

up:
	docker-compose -f $(NAME) up -d

down:
	docker-compose -f $(NAME) down

clean: down
	docker system prune -af
	docker volume prune -f
	rm -rf $(VOLUME)

re: clean all