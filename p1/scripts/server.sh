#!/usr/bin/env bash
export PATH=$PATH:/usr/local/bin/
mkdir -p /etc/rancher/k3s/
cp /vagrant/confs/config.yaml /etc/rancher/k3s/config.yaml
k3s server &
cp /etc/rancher/k3s/k3s.yaml /vagrant/
cp /var/lib/rancher/k3s/server/node-token /vagrant/
