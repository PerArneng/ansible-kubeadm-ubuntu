#!/usr/bin/env bash

if [ -z "$1" ]
  then
    echo "no host supplied"
    exit 1
fi

remote_host=$1

echo "installing to: $remote_host"

ansible-playbook \
    --ask-become-pass -i "$remote_host," \
    -c ssh \
    --become-method=sudo --become \
    --extra-vars="hosts=$remote_host" ansible-kubeadm.yml
