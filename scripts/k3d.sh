#!/usr/bin/env bash
set -x
export TAG=v5.0.0
sudo ${pk} remove docker docker-engine docker.io containerd runc
sudo ${pk} update
sudo ${pk} install -y ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo ${pk} update
sudo ${pk} install -y docker-ce docker-ce-cli containerd.io
sudo groupadd docker || true
sudo usermod -aG docker $USER || true
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
if command -v wget; then
	wget -q -O - https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash
elif command -v curl; then
	curl -s https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash
fi
