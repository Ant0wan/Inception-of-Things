#!/usr/bin/env bash
export PATH=$PATH:/usr/local/bin/
mkdir -p /etc/rancher/k3s/
curl -sfL https://get.k3s.io | sh -s -
cp /vagrant/confs/$1.yaml /etc/rancher/k3s/$1.yaml
if [ $1 == "server" ]; then
	k3s server &
	cp /etc/rancher/k3s/k3s.yaml /vagrant/
	cp /var/lib/rancher/k3s/server/node-token /vagrant/
	echo "I am a server"
else
	echo "I am an agent"
fi
