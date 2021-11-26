#!/usr/bin/env bash
curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh" | bash
sudo install ./kustomize /usr/bin
rm ./kustomize
