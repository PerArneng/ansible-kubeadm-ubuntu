#!/usr/bin/env bash

if [ -z "$1" ]
  then
    echo "no dockerhub username supplied"
    exit 1
fi

if [ -z "$2" ]
  then
    echo "no dockerhub password supplied"
    exit 1
fi


if [ -z "$3" ]
  then
    echo "no dockerhub email supplied"
    exit 1
fi

if [ -z "$4" ]
  then
    echo "no key name supplied"
    exit 1
fi

kubectl create secret docker-registry \
  $4 \
  --docker-server=https://index.docker.io/v1/ \
  --docker-username=$1 \
  --docker-password=$2 \
  --docker-email=$3

