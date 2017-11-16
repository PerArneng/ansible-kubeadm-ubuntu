#!/usr/bin/env bash

if [ -z "$1" ]
  then
    echo "no host supplied"
    exit 1
fi

if [ -z "$2" ]
  then
    echo "no user supplied"
    exit 1
fi

remote_host=$1
remote_user=$2

echo "installing to: $remote_host"

ansible-playbook \
    --ask-become-pass -i "$remote_host," \
    -c ssh \
    --become-method=sudo --become \
    --extra-vars="hosts=$remote_host, user=$remote_user" --tags "kubernetes,userconfig" ansible-kubeadm.yml
