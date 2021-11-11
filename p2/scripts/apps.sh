#!/usr/bin/env bash
cd /vagrant/confs/apps/base
kustomize build > /tmp/$1-base.yaml
envsubst < /tmp/$1-base.yaml | kubectl apply -f -
cd /vagrant/confs/apps/overlays/
if [ $1 == "app-three" ]; then
	envsubst < default-ingress.yaml > /tmp/$1-overlays.yaml
	kubectl apply -f /tmp/$1-overlays.yaml
else
	envsubst < ingress.yaml > /tmp/$1-overlays.yaml
	kubectl apply -f /tmp/$1-overlays.yaml
fi
