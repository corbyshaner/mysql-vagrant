# mysql-vagrant
Install mysql 5.6 vagrant machine

# installation
mkdir mysql-5-6

cd mysql-5-6

git init

git remote add -t mysql-5-6 -f origin https://github.com/altmannmarcelo/mysql-vagrant.git

git checkout mysql-5-6

vagrant up

# connection
vagrant ssh

mysql 

# credentials
MySQL default credentials, is highly recommended that you run mysql_secure_install script

