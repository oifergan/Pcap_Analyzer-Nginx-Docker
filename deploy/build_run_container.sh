#!/bin/bash

####### Make sure Docker Engine runs and stops old container ######

sudo systemctl start docker
sleep 5
sudo docker stop $(docker ps|grep oifergan:Pcap_Analyzer-Nginx-Docker|awk '{print $1}')

####### Build the and RUN the Docker Pcap_Analyzer-Nginx-Docker Container ######

cd /tmp/Pcap_Analyzer-Nginx-Docker/

sudo docker build -t oifergan:Pcap_Analyzer-Nginx-Docker .
sudo docker run -d -p 8081:80 oifergan:Pcap_Analyzer-Nginx-Docker

####### remove all leftovers from /tmp folder ######

cd /tmp
sudo rm -rf /tmp/Pcap_Analyzer-Nginx-Docker
