############################################################
# Dockerfile to build CentOS,Nginx installed  Container
# Based on CentOS
############################################################

# Set the base image to Centos7
FROM centos:latest

# File Author / Maintainer
MAINTAINER Omri Ifergan <oifergan80@gmail.com>

# Add the ngix and PHP dependent repository
ADD nginx.repo /etc/yum.repos.d/nginx.repo

# Installing nginx 
RUN yum -y install nginx

# Installing PHP
RUN yum -y --enablerepo=remi,remi-php56 install nginx php-fpm php-common

# Installing supervisor
RUN yum install -y python-setuptools
RUN easy_install pip
RUN pip install supervisor

# Installing ps_analyser dependencies

RUN yum -y install libnl-devel.x86_64 libnl.x86_64
RUN yum -y install json-c libtool numad.x86_64 numactl-devel.x86_64 numactl.x86_64


# Adding the configuration file of the nginx
ADD nginx/nginx.conf /etc/nginx/nginx.conf
ADD nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf
ADD php.ini /etc/php.ini
ADD html/index.html /usr/share/nginx/html/index.html
ADD html/upload.php /usr/share/nginx/html/upload.php
ADD html/ps_analyzer_all /usr/share/nginx/html/ps_analyzer_all
ADD www.conf /etc/php-fpm.d/www.conf
ADD php-fpm.conf /etc/php-fpm.conf
RUN mkdir /usr/share/nginx/html/uploads
RUN chmod -R 777 /usr/share/nginx/html/uploads
RUN chmod -R +x /usr/share/nginx/html/upload.php
RUN chmod  +x /usr/share/nginx/html/ps_analyzer_all

# Adding the configuration file of the Supervisor
ADD supervisord.conf /etc/

# Set the port to 80 
EXPOSE 80

# Executing supervisord
CMD ["supervisord", "-n"]
#CMD ["/bin/bash"]
