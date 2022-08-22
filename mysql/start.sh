#!/bin/bash
cur_dir=`pwd`

docker stop mysql-3306
docker rm mysql-3306
# docker stop mysql-3307
# docker rm mysql-3307
# docker run --name mysql-3306 -v ${cur_dir}/conf/my3306.cnf:/etc/mysql/conf.d/mysqld.cnf -v ${cur_dir}/data3306:/var/lib/mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=123456 -d mysql:5.6
# docker run --name mysql-3307 -v ${cur_dir}/conf/my3307.cnf:/etc/mysql/conf.d/mysqld.cnf -v ${cur_dir}/data3307:/var/lib/mysql -p 3307:3306 -e MYSQL_ROOT_PASSWORD=123456 -d mysql:5.6

docker run --name mysql-3306 -v ${cur_dir}/conf/my.cnf:/etc/mysql/conf.d/mysqld.cnf  -p 3306:3306 -e MYSQL_ROOT_PASSWORD=123456 -d mysql:5.6
# docker run --name mysql-3307 -v ${cur_dir}/conf/my3307.cnf:/etc/mysql/conf.d/mysqld.cnf -p 3307:3306 -e MYSQL_ROOT_PASSWORD=123456 -d mysql:5.6