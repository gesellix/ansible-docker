FROM ubuntu:14.04
MAINTAINER Tobias Gesellchen <tobias@gesellix.de> (@gesellix)

ENV ANSIBLE_VERSION 1.9

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y software-properties-common && \
    apt-add-repository ppa:ansible/ansible-1.9 && apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y ansible python python-simplejson && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /etc/ansible && echo '[local]\nlocalhost\n' > /etc/ansible/hosts

# workaround for Ansible <= 1.9.4
# see https://github.com/ansible/ansible-modules-core/pull/2258
RUN find . -type f -name "docker.py" -exec sed -i "s/image\['ContainerConfig'\]\['ExposedPorts'\]/image['ContainerConfig'].get('ExposedPorts')/g" {} +
RUN find . -type f -name "docker.py" -exec sed -i "s/container\[\"Config\"]\[\"ExposedPorts\"\]/container['Config'].get('ExposedPorts')/g" {} +

CMD ["ansible"]
