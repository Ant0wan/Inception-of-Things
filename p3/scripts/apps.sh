#!/usr/bin/env bash
cd /vagrant/confs/apps/base
kustomize build > /tmp/$1-base.yaml
envsubst < /tmp/$1-base.yaml | kubectl apply -f -
cd /vagrant/confs/apps/overlays/$1
kustomize build > /tmp/$1-overlays.yaml
envsubst < /tmp/$1-overlays.yaml | kubectl apply -f -
