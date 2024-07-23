# use debian as the base image
FROM debian:bullseye

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y wget
RUN apt-get install -y php7.4 php-fpm php-mysql mariadb-client

# a command-line interface for WordPress, you can manage WordPress once it's downloaded
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

RUN wget https://wordpress.org/wordpress-6.5.5.tar.gz -P /var/www/html
RUN cd /var/www/html \
	&& tar -xzf /var/www/html/wordpress-6.5.5.tar.gz \
	&& rm /var/www/html/wordpress-6.5.5.tar.gz

# ensure that the web server(nginx) has the necessary permissions to read and execute the files within the web root directory
RUN chown -R www-data:www-data /var/www/*
RUN chmod -R 755 /var/www/*

EXPOSE 9000

COPY ./tools/wpscript.sh ./

RUN chmod +x ./wpscript.sh

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

ENTRYPOINT ["bash", "./wpscript.sh"]