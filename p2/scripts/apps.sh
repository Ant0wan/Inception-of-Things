#!/usr/bin/env bash
cd /vagrant/apps/
kustomize build > /tmp/$1.yaml
envsubst < /tmp/$1.yaml | kubectl apply -f -
