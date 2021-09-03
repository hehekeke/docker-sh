#!/bin/bash
cur_dir=`pwd`

#docker run -itd --name centos-test centos:centos7

docker stop RealServer1
docker rm RealServer1
docker stop RealServer2
docker rm RealServer2

docker network create --subnet=172.18.0.0/16 mynetwork

docker run -itd  --privileged --name RealServer1 --net mynetwork --ip 172.18.0.2 wyqwb/centos-test

docker run -itd  --privileged --name RealServer2 --net mynetwork --ip 172.18.0.3 wyqwb/centos-test

# docker run -itd  --privileged --name node3 --net mybridge --ip 172.30.0.4 wyqwb/centos-test

