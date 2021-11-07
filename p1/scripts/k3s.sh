#!/usr/bin/env bash
export PATH=$PATH:/usr/local/bin/
mkdir -p /etc/rancher/k3s/
curl -sfL https://get.k3s.io | sh -s -
cp /vagrant/confs/$1.yaml /etc/rancher/k3s/$1.yaml
if [ $1 == "server" ]; then
	k3s server &
	cp /var/lib/rancher/k3s/server/node-token /vagrant/
	cp /etc/rancher/k3s/k3s.yaml /vagrant/
	echo "alias k='/usr/local/bin/k3s kubectl'" >> /root/.bashrc
else
	k3s agent -s $2 -t $(cat /vagrant/node-token)
fi
