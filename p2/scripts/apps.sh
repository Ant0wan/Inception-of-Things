#!/usr/bin/env bash
cd /vagrant/confs/apps/base
kustomize build | envsubst > /tmp/$1.yaml
cd /vagrant/confs/apps/overlays/
if [ $1 == "app-three" ]; then
	envsubst < default-ingress.yaml >> /tmp/$1.yaml
else
	envsubst < ingress.yaml >> /tmp/$1.yaml
fi
kubectl apply -f /tmp/$1.yaml
