#!/bin/bash

cd ../../

tar -czf nDPI-Nginx-Docker.tar.gz nDPI-Nginx-Docker 
mv nDPI-Nginx-Docker.tar.gz nDPI-Nginx-Docker

cd -

ansible-playbook deploy.yml
