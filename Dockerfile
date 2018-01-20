FROM alpine:edge
MAINTAINER Tobias Gesellchen <tobias@gesellix.de> (@gesellix)

ENV REFRESH_DATE 2018-01-20
ENV ANSIBLE_VERSION latest

ENV PATH /ansible/bin:/bin:/usr/bin:/sbin:/usr/sbin
ENV PYTHONPATH /ansible/lib
ENV ANSIBLE_LIBRARY /ansible/library

RUN apk --update add openssh-client python py-yaml py-jinja2 py-simplejson py-httplib2 py-paramiko py-crypto rsync \
    && mkdir -p /etc/ansible && echo '[local]\nlocalhost\n' > /etc/ansible/hosts \
    && apk add --virtual build-dependencies git py-setuptools py2-pip python-dev build-base \
    && pip install six nose passlib pycrypto \
    && git clone git://github.com/ansible/ansible.git --recursive \
    && cd /ansible \
    && apk del build-dependencies \
    && bin/ansible --version

WORKDIR /ansible

CMD ["ansible", "--version"]
