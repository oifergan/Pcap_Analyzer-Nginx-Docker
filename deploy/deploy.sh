#!/bin/bash

cd ../../

tar -czf Pcap_Analyzer-Nginx-Docker.tar.gz Pcap_Analyzer-Nginx-Docker 
mv Pcap_Analyzer-Nginx-Docker.tar.gz Pcap_Analyzer-Nginx-Docker

cd -

ansible-playbook deploy.yml
