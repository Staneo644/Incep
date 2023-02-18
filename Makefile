#FILEDOCKER := requirements
#DOCKER := mariadb nginx wordpress
#NAME := image

#DOCKERIMAGE := $(addprefix $(addprefix $(FILESRCS)/,$(FILEDOCKER)/, $(DOCKER)))

#DOCKERCOMPOSE := $(addprefix $(FILESRCS)/, docker-compose.yml

FILESRCS := srcs
NAME := $(addprefix $(FILESRCS)/,docker-compose.yml)

all : build up

build:
	docker-compose -f $(NAME) build
	docker-compose -f $(NAME) create

up:
	docker-compose -f $(NAME) up -d

down:
	docker-compose -f $(NAME) down

clean: down
	docker system prune -af
	docker volume prune -f

re: clean all