#!/usr/bin/env bash


if [ -z "$1" ]
  then
    echo "no user supplied"
    exit 1
fi

remote_user=$1

echo "installing"

ansible-playbook \
    --ask-become-pass -i "localhost," \
    -c local \
    --become-method=sudo --become \
    --extra-vars="hosts=$remote_host, user=$remote_user" --tags "kubectl" ansible-minikube-client.yml
