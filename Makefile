all: 
	sudo mkdir -p /home/ayael-ou/data/mariadb
	sudo mkdir -p /home/ayael-ou/data/wordpress
	sudo docker-compose -f ./srcs/docker-compose.yml build
	sudo docker-compose -f ./srcs/docker-compose.yml up -d

logs:
	@sudo docker-compose -f ./srcs/docker-compose.yml  logs mariadb
	@sudo docker-compose -f ./srcs/docker-compose.yml logs wordpress
	@sudo docker-compose -f ./srcs/docker-compose.yml  logs nginx

clean:
	@sudo docker container stop nginx mariadb wordpress
	@sudo docker-compose -f ./srcs/docker-compose.yml down
	# @sudo docker network rm net_inception

fclean: clean
	@sudo rm -rf /home/ayael-ou/data/mariadb/*
	@sudo rm -rf /home/ayael-ou/data/wordpress/*
	@sudo docker system prune -af

re: fclean all

.Phony: all logs clean fclean