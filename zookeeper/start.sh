#!/bin/bash
cur_dir=`pwd`

#docker run -itd --name centos-test centos:centos7

docker stop node1
docker rm node1
docker stop node2
docker rm node2
docker stop node3
docker rm node3

docker network create --subnet=172.18.0.0/16 mynetwork

docker run -itd  --privileged --hostname node1 --name node1 --net mynetwork  wyqwb/centos-test

docker run -itd  --privileged --hostname node2 --name node2 --net mynetwork  wyqwb/centos-test

docker run -itd  --privileged --hostname node3 --name node3 --net mynetwork  wyqwb/centos-test


docker run -itd  --privileged --hostname node4 --name node4 --net mynetwork  wyqwb/centos-test

