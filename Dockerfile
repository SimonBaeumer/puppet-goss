FROM centos:7
MAINTAINER Simon Bäumer

RUN rpm -Uvh https://yum.puppet.com/puppet6/puppet6-release-el-7.noarch.rpm
RUN yum install -y puppet-agent

RUN echo "127.0.0.1 puppetselfcontained.example puppetselfcontained" >> /etc/hosts

WORKDIR /app

CMD [ "/bin/bash" ]
