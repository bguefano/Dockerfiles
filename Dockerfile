FROM ubuntu:18.04
MAINTAINER bguefano <bguefano.github@gmail.com>
RUN sudo apt update && \
    sudo apt install software-properties-common && \
    sudo apt-add-repository --yes --update ppa:ansible/ansible && \
    sudo apt install ansible
