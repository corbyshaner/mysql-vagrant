#!/bin/bash
set -x
sudo yum install -y https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm
sudo yum -y update
sudo yum -y install mysql-server
sudo systemctl start mysqld
sudo systemctl enable mysqld
MYSQL_TEMP_PWD=`sudo cat /var/log/mysqld.log | grep 'A temporary password is generated' | awk -F'root@localhost: ' '{print $2}'`
mysqladmin -u root -p`echo $MYSQL_TEMP_PWD` password 'Passw0rd!'
cat << EOF > .my.cnf
[client]
user=root
password=Passw0rd!
EOF
sudo cp /home/vagrant/.my.cnf /root/.my.cnf
mysql -e "CREATE USER 'root'@'%' IDENTIFIED BY 'Passw0rd\!'; GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;"

