#!/bin/bash

cd ../../

sudo tar -czf Pcap_Analyzer-Nginx-Docker.tar.gz Pcap_Analyzer-Nginx-Docker 
sudo mv Pcap_Analyzer-Nginx-Docker.tar.gz Pcap_Analyzer-Nginx-Docker

cd -

sudo ansible-playbook deploy.yml
