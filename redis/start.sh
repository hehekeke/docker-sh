#!/bin/bash
cur_dir=`pwd`

mkdir -p $cur_dir/conf
mkdir -p $cur_dir/data

docker stop redis-wyq
docker rm redis-wyq

#-v /usr/docker/tlmall-redis/conf/redis.conf:/etc/redis.conf
# 容器启动的时候，将本机目录下面的redis.conf映射到容器中去

#-v /usr/docker/tlmall-redis/data:/data
# 映射数据存储的路径

#-d redis:6.0.16 redis-server /etc/redis.conf
# 后台启动redis-server，并且指定配置文件启动
docker run --name redis-wyq \
-v $cur_dir/conf/redis.conf:/etc/redis.conf \
-v $cur_dir/data:/data \
-p 6379:6379 \
-d redis redis-server /etc/redis.conf
