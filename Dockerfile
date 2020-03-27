FROM ubuntu:18.04
MAINTAINER bguefano <bguefano.github@gmail.com>
RUN apt update -y && \
    apt install software-properties-common -y && \
    apt-add-repository --yes --update ppa:ansible/ansible && \
    apt install ansible -y
