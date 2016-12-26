#!/bin/bash

####### Make sure Docker Engine runs and stops old container ######

sudo systemctl start docker
sleep 5
sudo docker stop $(docker ps|grep oifergan:nDPI-Nginx-Docker|awk '{print $1}')

####### Build the and RUN the Docker nDPI-Nginx-Docker Container ######

cd /tmp/nDPI-Nginx-Docker/

sudo docker build -t oifergan:nDPI-Nginx-Docker .
sudo docker run -d -p 8081:80 oifergan:nDPI-Nginx-Docker

