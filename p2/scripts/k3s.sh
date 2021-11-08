#!/usr/bin/env bash
export PATH=$PATH:/usr/local/bin/
#systemctl disable firewalld --now
mkdir -p /etc/rancher/k3s/
cp /vagrant/confs/config.yaml /etc/rancher/k3s/config.yaml
curl -sfL https://get.k3s.io | sh -
cat << ALIAS | sudo tee -a /root/.bashrc
export PATH=$PATH:/usr/local/bin/
alias k='/usr/local/bin/k3s kubectl'
alias kubectl='/usr/local/bin/k3s kubectl'
ALIAS
