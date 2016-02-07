FROM ubuntu:14.04
MAINTAINER Tobias Gesellchen <tobias@gesellix.de> (@gesellix)

ENV ANSIBLE_VERSION 2

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y software-properties-common && \
    apt-add-repository ppa:ansible/ansible && apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y ansible python python-simplejson && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /etc/ansible && echo '[local]\nlocalhost\n' > /etc/ansible/hosts

CMD ["ansible"]
