#!/usr/bin/env bash
export PATH=$PATH:/usr/local/bin/
systemctl disable firewalld --now
systemctl daemon-reload
mkdir -p /etc/rancher/k3s/
cp /vagrant/confs/$1.yaml /etc/rancher/k3s/config.yaml
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC=$1 sh -
if [ -e /var/lib/rancher/k3s/server/node-token ]; then
	cp -n /var/lib/rancher/k3s/server/node-token /vagrant/
	cat << ALIAS | sudo tee -a /root/.bashrc
export PATH=$PATH:/usr/local/bin/
alias k='/usr/local/bin/k3s kubectl'
alias kubectl='/usr/local/bin/k3s kubectl'
ALIAS
fi
if [ -e /etc/rancher/k3s/k3s.yaml ]; then
	cp -n /etc/rancher/k3s/k3s.yaml /vagrant/
fi
