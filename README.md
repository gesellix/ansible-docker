# ansible-docker

An Ansible Docker image


## Selecting an Ansible version

The most recent Ansible version is available as `latest` via

    docker pull gesellix/ansible:latest

You may choose an explicit tag to select your desired version. Available are e.g.:

    docker pull gesellix/ansible:1.9.4
    docker pull gesellix/ansible:2.0.0.2
    docker pull gesellix/ansible:2.0.1.0
    docker pull gesellix/ansible:2.0.2.0
    docker pull gesellix/ansible:2.1.0.0
    docker pull gesellix/ansible:2.1.2.0
    docker pull gesellix/ansible:2.2.0.0
    docker pull gesellix/ansible:2.3.0.0
    docker pull gesellix/ansible:2.3.2.0

_Note_: For Ansible 1.9.4 you'll get a patched Docker module which essentially applies the
changes from [ansible-modules-core#2258](https://github.com/ansible/ansible-modules-core/pull/2258).


## Usage

You can use the Ansible image in your Dockerfile:

    FROM gesellix/ansible:2.3.0.0

    ADD . /ansible
    WORKDIR /ansible

    CMD ["ansible", "--version"]

The example Dockerfile assumes that your Ansible roles and playbooks are in the same directory.
