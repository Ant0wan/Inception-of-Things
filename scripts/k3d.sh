#!/usr/bin/env bash
export TAG=v5.0.0
if command -v wget; then
	wget -q -O - https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash
elif command -v curl; then
	curl -s https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash
fi
