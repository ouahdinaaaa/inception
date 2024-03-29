# use debian as the base image
FROM debian:buster

# install MariaDB and other dependencies
RUN apt update -y \
	&& apt upgrade -y \
	&& apt install -y mariadb-server \
	&& apt install -y mariadb-client \
	&& apt install -y procps


# copy the provided config file to the container
COPY ./conf/maria.conf /etc/mysql/my.cnf

COPY ./tools/dbscript.sh ./

RUN mkdir -p /var/run/mysqld
RUN mkdir -p /var/lib/mysql
RUN mkdir -p /var/log/mysql

RUN chown -R mysql:mysql /var/run/mysqld
RUN chown -R mysql:mysql /var/lib/mysql
RUN chown -R mysql:mysql /var/log/mysql

RUN chmod -R 755 /var/run/mysqld
RUN chmod -R 755 /var/log/mysql
RUN chmod -R 755 /var/lib/mysql

RUN chmod +x ./dbscript.sh && \
	chown mysql:mysql ./dbscript.sh

EXPOSE 3306


ENTRYPOINT ["bash", "./dbscript.sh"]