#!/bin/bash
cur_dir=`pwd`

docker stop redis-wyq
docker rm redis-wyq
docker run  --name redis-wyq -p 6379:6379 -d redis