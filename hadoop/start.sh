#!/bin/bash
cur_dir=`pwd`


docker stop node1
docker rm node1
docker stop node2
docker rm node2

docker network create --subnet=172.18.0.0/16 mynetwork


docker run --name='node1' \
      -itd --privileged  \
      --net mynetwork \
      --ip 172.18.0.2 \
	  -p 50070:50070 \
	  -p 8088:8088 \
	  -p 9000:9000 \
	  -p 50090:50090 \
	  wyqwb/wyq-base-centos	  
	  