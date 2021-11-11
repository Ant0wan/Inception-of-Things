#!/usr/bin/env bash
export TAG=v5.0.0
if command -v wget; then
	wget -q -O - https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash
elif command -v curl; then
	curl -s https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash
fi
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get update
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
