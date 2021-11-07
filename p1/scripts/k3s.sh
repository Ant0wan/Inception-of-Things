#!/usr/bin/env bash
export PATH=$PATH:/usr/local/bin/
mkdir -p /etc/rancher/k3s/
cp /vagrant/confs/$1.yaml /etc/rancher/k3s/config.yaml
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC=$1 sh -
if [ -e /var/lib/rancher/k3s/server/node-token ]; then
	cp -n /var/lib/rancher/k3s/server/node-token /vagrant/
fi
if [ -e /etc/rancher/k3s/k3s.yaml ]; then
	cp -n /etc/rancher/k3s/k3s.yaml /vagrant/
fi
