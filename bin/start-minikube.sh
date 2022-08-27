#!/bin/bash

set -eu

# change the name of the profile for example knativesandbox
PROFILE_NAME=${PROFILE_NAME:-mysandbox}
MEMORY=${MEMORY:-16384}
CPUS=${CPUS:-6}
unamestr=$(uname)

if [ "$unamestr" == "Darwin" ];
then
  minikube start -p "$PROFILE_NAME" \
  --memory="$MEMORY" \
  --driver=hyperkit \
  --cpus="$CPUS" \
  --kubernetes-version=v1.24.3 \
  --disk-size=50g \
  --insecure-registry='10.0.0.0/24'
else
  minikube start -p "$PROFILE_NAME" \
  --memory="$MEMORY" \
  --cpus="$CPUS" \
  --kubernetes-version=v1.24.3 \
  --disk-size=50g \
  --insecure-registry='10.0.0.0/24'
fi
