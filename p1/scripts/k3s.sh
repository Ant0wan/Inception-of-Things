#!/usr/bin/env bash
export PATH=$PATH:/usr/local/bin/
mkdir -p /etc/rancher/k3s/
cp /vagrant/confs/$1.yaml /etc/rancher/k3s/config.yaml
curl -sfL https://get.k3s.io | sh -s -
if $(ps aux | grep k3s | grep server); then
	cp /var/lib/rancher/k3s/server/node-token /vagrant/
	cp /etc/rancher/k3s/k3s.yaml /vagrant/
	echo "alias k=\'/usr/local/bin/k3s kubectl\'" >> /root/.bashrc
fi
