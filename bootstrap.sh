#!/bin/bash

sudo yum install -y wget
wget https://dev.mysql.com/get/mysql57-community-release-el7-8.noarch.rpm
sudo yum install -y mysql57-community-release-el7-8.noarch.rpm
sudo sed -i '/mysql56-community/{n;n;n;s/enabled=0/enabled=1/}' /etc/yum.repos.d/mysql-community.repo
sudo sed -i '/mysql57-community/{n;n;n;s/enabled=1/enabled=0/}' /etc/yum.repos.d/mysql-community.repo
sudo yum -y update
sudo yum -y install mysql-server 
sudo systemctl start mysqld
sudo systemctl enable mysqld
