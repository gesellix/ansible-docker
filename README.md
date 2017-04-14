# ansible-docker

An Ansible Docker image based on Alpine Linux.


## Selecting an Ansible version

The Ansible development snapshot is available as `latest` via:

    docker pull gesellix/ansible:latest

You should choose an explicit tag to select your desired version. Available are:

    docker pull gesellix/ansible:1.9.4
    docker pull gesellix/ansible:2.3.0.0

The complete list of available tags can be found on the [Docker Hub](https://hub.docker.com/r/gesellix/ansible/tags/).

_Note_: The image for Ansible 1.9.4 is based on Ubuntu instead of Alpine and it contains a patched Docker module which essentially applies the 
changes from [ansible-modules-core#2258](https://github.com/ansible/ansible-modules-core/pull/2258).


## Usage

You can use the Ansible image in your Dockerfile:

    FROM gesellix/ansible:2.3.0.0

    ADD . /ansible
    WORKDIR /ansible

    CMD ["ansible", "--version"]

The example Dockerfile assumes that your Ansible roles and playbooks are in the same directory.
