all: 
	mkdir -p /home/ayael-ou/data/mariadb
	mkdir -p /home/ayael-ou/data/wordpress
	sudo docker compose -f ./srcs/docker-compose.yml build
	sudo docker compose -f ./srcs/docker-compose.yml up -d

logs:
	sudo docker logs wordpress
	sudo docker logs mariadb
	sudo docker logs nginx

clean:
	sudo docker container stop nginx mariadb wordpress
	sudo docker network rm srcs_net_inception 

fclean: clean
	@sudo rm -rf /home/ayael-ou/data/mariadb/*
	@sudo rm -rf /home/ayael-ou/data/wordpress/*
	@sudo docker system prune -af

re: fclean all

.Phony: all logs clean fclean