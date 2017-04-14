FROM alpine:edge
MAINTAINER Tobias Gesellchen <tobias@gesellix.de> (@gesellix)

ENV ANSIBLE_VERSION 2.3.0.0
ENV ANSIBLE_RELEASE_URL "http://releases.ansible.com/ansible/ansible-${ANSIBLE_VERSION}.tar.gz"

ENV PATH /ansible/bin:/bin:/usr/bin:/sbin:/usr/sbin
ENV PYTHONPATH /ansible/lib
ENV ANSIBLE_LIBRARY /ansible/library

RUN apk --update add openssh-client python py-yaml py-jinja2 py-simplejson py-httplib2 py-paramiko \
    && mkdir -p /etc/ansible && echo '[local]\nlocalhost\n' > /etc/ansible/hosts \
    && apk add --virtual build-dependencies curl py-setuptools py2-pip python-dev \
    && curl -X GET -o /tmp/ansible.tar.gz ${ANSIBLE_RELEASE_URL} \
    && cd /tmp && tar xfz ansible.tar.gz && mv ansible-${ANSIBLE_VERSION} /ansible && rm ansible.tar.gz \
    && cd /ansible \
    && apk del build-dependencies \
    && bin/ansible --version

WORKDIR /ansible

CMD ["ansible", "--version"]
