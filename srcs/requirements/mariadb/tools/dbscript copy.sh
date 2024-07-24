#!/bin/bash
#set -eux

service mysql start;
sleep 10;

mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'wordpress.net_inception' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'wordpress.net_inception' WITH GRANT OPTION;"

mysql -e "CREATE USER IF NOT EXISTS \`${ADMIN_USER}\`@'%' IDENTIFIED BY '${ADMIN_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO \`${ADMIN_USER}\`@'%' WITH GRANT OPTION;"

mysql -u root -p${SQL_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;"
# mysqladmin -u root -p${SQL_ROOT_PASSWORD} -e "SHUTDOWN;"
mysqladmin -u root -proot shutdown


exec mysqld_safe

echo "MariaDB database and user were created successfully! "