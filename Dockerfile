FROM ubuntu:14.04
MAINTAINER Tobias Gesellchen <tobias@gesellix.de> (@gesellix)

ENV ANSIBLE_VERSION 2.0.0.2

RUN apt-get update && \
    apt-get install -y curl python python-jinja2 python-yaml && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN echo "downloading Ansible ${ANSIBLE_VERSION}..." && \
    curl -X GET -o /tmp/ansible.tar.gz "http://releases.ansible.com/ansible/ansible-${ANSIBLE_VERSION}.tar.gz" && \
    cd /tmp && tar xfz ansible.tar.gz && mv ansible-${ANSIBLE_VERSION} /ansible && rm ansible.tar.gz && cd /

ENV PATH /ansible/bin:/bin:/usr/bin:/sbin:/usr/sbin
ENV PYTHONPATH /ansible/lib

RUN mkdir -p /etc/ansible && echo '[local]\nlocalhost\n' > /etc/ansible/hosts

CMD ["/ansible/bin/ansible"]
