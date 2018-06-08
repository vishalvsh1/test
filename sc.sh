#!/bin/bash -x

# this deb file will allow us to add the necessary erlang and rabbitmq repositories entries to the 'apt' list
echo "deb https://packages.erlang-solutions.com/ubuntu xenial contrib" | sudo tee /etc/apt/sources.list.d/erlang-solutions.list
wget --quiet -O - https://packages.erlang-solutions.com/ubuntu/erlang_solutions.asc | sudo apt-key add -
echo "deb https://dl.bintray.com/rabbitmq/debian xenial main" | sudo tee /etc/apt/sources.list.d/bintray.rabbitmq.list
wget -O- https://dl.bintray.com/rabbitmq/Keys/rabbitmq-release-signing-key.asc | sudo apt-key add -




sudo apt-get update
sudo apt-get install -y esl-erlang
sudo apt-get install -y rabbitmq-server


sudo rabbitmqctl add_user zimperium <my_super_secret_password>
sudo rabbitmqctl set_permissions -p / zimperium '.*' '.*' '.*'
sudo rabbitmqctl set_user_tags zimperium administrator
sudo rabbitmq-plugins enable rabbitmq_management
