#!/bin/bash
cur_dir=`pwd`


docker stop rmqserver
docker rm rmqserver

#启动NameServer
docker run -d -p 9876:9876 --name rmqserver  --net mynetwork foxiswho/rocketmq:server-4.5.1

#启动broker
docker stop rmqbroker
docker rm rmqbroker
docker run -d -p 10911:10911 -p 10909:10909\
 --name rmqbroker  --net mynetwork --link rmqserver:namesrv\
 -e "NAMESRV_ADDR=namesrv:9876" -e "JAVA_OPTS=-Duser.home=/opt"\
 -e "JAVA_OPT_EXT=-server -Xms128m -Xmx128m"\
 -v ${cur_dir}/conf/broker.conf:/etc/rocketmq/broker.conf \
 foxiswho/rocketmq:broker-4.5.1




#启动rmqconsole
docker stop rmqconsole
docker rm rmqconsole
docker run -d --name rmqconsole -p 8180:8080  --net mynetwork --link rmqserver:namesrv\
 -e "JAVA_OPTS=-Drocketmq.namesrv.addr=namesrv:9876\
 -Dcom.rocketmq.sendMessageWithVIPChannel=false"\
 -t styletang/rocketmq-console-ng