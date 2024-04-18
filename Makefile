all: 
	mkdir -p /home/ayael-ou/data/mariadb
	mkdir -p /home/ayael-ou/data/wordpress
	docker compose -f ./srcs/docker-compose.yml build
	docker compose -f ./srcs/docker-compose.yml up -d

logs:
	docker logs wordpress
	docker logs mariadb
	docker logs nginx

clean:
	docker container stop nginx mariadb wordpress
	docker network rm srcs_net_inception

fclean: clean
	@sudo rm -rf /home/ayael-ou/data/mariadb/*
	@sudo rm -rf /home/ayael-ou/data/wordpress/*
	@docker system prune -af

re: fclean all

.Phony: all logs clean fclean