#!/bin/bash

set -eu

# change the name of the profile for example knativesandbox
PROFILE_NAME=mysandbox
MEMORY=16384
CPUS=6
unamestr=$(uname)

if [ "$unamestr" == "Darwin" ]; then
  minikube start -p "$PROFILE_NAME" \
  --memory="$MEMORY" \
  --driver=hyperkit \
  --cpus="$CPUS" \
  --kubernetes-version=v1.24.3 \
  --disk-size=50g \
  --insecure-registry='10.0.0.0/24'
elif [ "$unamestr" == "Linux" ]; then
  /usr/bin/minikube start -p $PROFILE_NAME \
  --driver=docker \
  --memory $MEMORY \
  --cpus $CPUS \
  --kubernetes-version=v1.24.3 \
  --disk-size=50g \
  --insecure-registry='10.0.0.0/24'

  /usr/bin/minikube -p $PROFILE_NAME addons enable metrics-server
  /usr/bin/minikube -p $PROFILE_NAME addons enable dashboard
  /usr/bin/minikube -p $PROFILE_NAME addons enable ingress
  /usr/bin/minikube -p $PROFILE_NAME addons enable storage-provisioner
fi

