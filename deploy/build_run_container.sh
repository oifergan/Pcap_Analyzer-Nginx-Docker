#!/bin/bash

####### Build the and RUN the Docker nDPI-Nginx-Docker Container ######

cd /tmp/nDPI-Nginx-Docker/

sudo docker build -t oifergan:nDPI-Nginx-Docker .
sudo docker run -d -p 8081:80 oifergan:nDPI-Nginx-Docker

