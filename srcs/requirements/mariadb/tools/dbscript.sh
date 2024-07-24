#!/bin/bash
#set -eux

service mysql start;
sleep 10;


# CREATE USER #
echo "CREATE USER 'ayael-ou'@'%' IDENTIFIED BY 'Natsume1639!';" | mysql


# PRIVILGES FOR ROOT AND USER FOR ALL IP ADRESS #
echo "GRANT ALL PRIVILEGES ON *.* TO 'ayael-ou'@'%' IDENTIFIED BY 'Natsume1639!';" | mysql
#echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$BDD_ROOT_PASSWORD';" | mysql
echo "FLUSH PRIVILEGES;" | mysql

# CREAT WORDPRESS DATABASE #
echo "CREATE DATABASE net-inception;" | mysql
mysqladmin -u root -proot shutdown


exec mysqld_safe

echo "MariaDB database and user were created successfully! "