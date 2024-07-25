FROM debian:bullseye

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update
RUN apt install nginx -y
RUN apt install openssl -y
	 

COPY conf/nginx.conf /etc/nginx/nginx.conf

# 1)create a directory to store certificates and keys 2)generate the keys
RUN openssl req -x509 -nodes -out /etc/ssl/certs/ayael-ou.42.crt -keyout /etc/ssl/private/ayael-ou.42.key -subj "/C=FR/ST=IDF/L=Paris/O=aya/OU=42/CN=ayael-ou.42.fr"
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

CMD ["nginx", "-g", "daemon off;"]