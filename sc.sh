   12  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
   13  sudo apt-key fingerprint 0EBFCD88
   14  sudo add-apt-repository    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   15     $(lsb_release -cs) \
   16     stable"
   17  sudo apt-get update
   18  apt-cache madison docker-ce
   19  sudo apt-get install docker-ce=18.03.0~ce-0~ubuntu
   20  df -h
   21  exit
   22  ls
   23  mv /tmp/docker-compose.yml  .
   24  sudo curl -L https://github.com/docker/compose/releases/download/1.16.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
   25  sudo chmod +x /usr/local/bin/docker-compose
