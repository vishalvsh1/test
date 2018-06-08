#!/bin/bash -x

sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update

sudo apt-get install oracle-java8-installer
sudo apt-get install oracle-java8-set-default

cd /opt
sudo wget "http://mirror.cc.columbia.edu/pub/software/apache/kafka/0.11.0.2/kafka_2.11-0.11.0.2.tgz" -O kafka.tgz
sudo tar -xvzf kafka.tgz
sudo rm kafka.tgz
# symbolic link created so that the folder name is memorable
sudo ln -s kafka_2.11-0.11.0.2 kafka



max.request.size=104857600
message.max.size=104857600
fetch.message.max.bytes=104857600
replica.fetch.max.bytes=104857600
log.dirs = /data/kafka/logs


autopurge.purgeInterval=24
autopurge.snapRetainCount=5


cd /opt/kafka
 
nohup bin/zookeeper-server-start.sh config/zookeeper.properties > zookeeper.log 2>&1 &
nohup bin/kafka-server-start.sh config/server.properties > kafka.log 2>&1 &

#mongo

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.6 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.6.list
sudo apt-get update


sudo apt-get install -y mongodb-org


sudo chown -R mongodb:mongodb /data/mongo

