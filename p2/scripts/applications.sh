#!/usr/bin/env bash
cd /vagrant/confs/$1
kustomize build > /tmp/$1.yaml
envsubst < /tmp/$1.yaml | apply -f -
