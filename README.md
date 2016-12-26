# Pcap_Analyzer-Nginx-Docker

[![Build Status](https://travis-ci.org/oifergan/Pcap_Analyzer-Nginx-Docker.svg?branch=master)](https://travis-ci.org/oifergan/Pcap_Analyzer-Nginx-Docker)

## What is Pcap_Analyzer-Nginx-Docker ?

It is a lightweight demonstration for pcap analyzing. Based on OpenDPI . This demo runs as a Web(Nginx) application over Docker container.

### How I Works

This demo runs as a Docker Container over Centos 7. 
#### In order to run it localy you need to have:

- Centos 7 station
- Docker engine installed


#### And just follow the steps bellow:

1. git clone https://github.com/oifergan/Pcap_Analyzer-Nginx-Docker
2. cd Pcap_Analyzer-Nginx-Docker
3. docker build -t oifergan:Pcap_Analyzer-Nginx-Docker .
4. docker run -d -p 8081:80 oifergan:Pcap_Analyzer-Nginx-Docker
5. from your favorite browser go to http://{your IP}:8081 and upload a pcap file

You should see an output on the page for the pcap statistics, Note that the uploaded file shouldn't exeed 1M...
 


#### If you would like to deploy it to remote servers there is also an option to run a simple script but you'll need:

on local machine:

- Centos 7
- Ansible installed

on each remote station:

- Centos 7
- Docker engine installed



#### If you don't Have Ansible installed you can use the following steps:


first you need to enable epel repo for centos 7....

1. rpm -Uvh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-8.noarch.rpm 

now you can install Ansible...

2. yum install ansible -y



#### After cloning the repo to your central server with Ansible installed, follow the steps:

1. edit the "/etc/ansible/hosts" file with the correct servers group name and the IP's of your remote stations in that group, for example:

   [remotservers]  
   192.168.1.1  
   192.168.1.5  
   .  
   .  
   .  
  
2. go to deploy folder and edit the "deploy.yml" with the correct hosts group name (the default is nginx).
3. from the deploy folder run "./deploy.sh"

###As an example you can deploy it against an ec2 instance i have in AWS  
Its IP is 54.213.239.136  
user/pass are: test/Psoi12#  
Dont forget to exchange keys using "ssh-copy-id test@54.213.239.136" from central server to remote one(this one).


And thats about it, you can try the web app for analyzing pcaps.




