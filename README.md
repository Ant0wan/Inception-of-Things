<!-- TITLE -->
<br />
<div align="center">
  <img src="logo.png" alt="Logo" width="80" height="80">
  <h1 align="center">Inception Of Things</h3>
  <p align="center">
    Local Kubernetes with CD using Vagrant, Rancher K3s and K3d.
  </p>
</div>

<div align="center">
	
[![Terraform](https://github.com/Ant0wan/Inception-of-Things/actions/workflows/terraform.yml/badge.svg)](https://github.com/Ant0wan/Inception-of-Things/actions/workflows/terraform.yml)
	
</div>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>

---
### Part 1: K3s on Vagrant

Install VirtualBox and Vagrant using the following scripts:

```=shell
#!/usr/bin/env bash
set -e
if command -v vagrant --version && command -v VBoxManage --version; then
	exit 0
fi
egrep -ac "vmx|svm" /proc/cpuinfo &>/dev/null
if [ ${pk} == "apt" ]; then
	sudo apt install -y \
		virtualbox-dkms \
		virtualbox-guest-additions-iso \
		virtualbox-guest-utils \
		virtualbox-qt \
		virtualbox
fi
sudo ${pk} install -y vagrant
vagrant plugin install vagrant-vbguest
```


```=shell
#!/usr/bin/env bash
set -ex
_package_manager_detect() {
	command -v apt &>/dev/null && export pk="apt" && return
	command -v yum &>/dev/null && export pk="yum" && return
	_error "No supported package manager installed on system"
	_error "(supported: apt or yum)"
	exit 1
}
_package_manager_detect
source virtualbox.sh
```

---
### Part 2: Three simple apps on K3s


---
### Part 3: K3d with Argo CD

Script to install required packages:

```=shell
#!/usr/bin/env bash
set -ex
export TAG=v5.0.0
_package_manager_detect() {
	command -v apt &>/dev/null && export pk="apt" && return
	command -v yum &>/dev/null && export pk="yum" && return
	_error "No supported package manager installed on system"
	_error "(supported: apt or yum)"
	exit 1
}
_docker_install() {
	sudo ${pk} remove docker docker-engine docker.io containerd runc
	sudo ${pk} update
	sudo ${pk} install -y ca-certificates curl gnupg lsb-release
	# NOT FEDORA COMPLIANT
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
	echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
	sudo ${pk} update
	sudo ${pk} install -y docker-ce docker-ce-cli containerd.io
	sudo groupadd docker || true
	sudo usermod -aG docker $USER || true
	sudo systemctl enable docker.service
	sudo systemctl enable containerd.service
}
_k3d_install() {
	if command -v wget; then
		wget -q -O - https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash
	elif command -v curl; then
		curl -s https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash
	fi
}
_terraform_install() {
	# NOT FEDORA COMPLIANT
	curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
	sudo apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
	sudo apt install terraform
}
_kubectl_install() {
	curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
	chmod +x kubectl
	sudo install ./kubectl /usr/bin/
	rm kubectl
}
_package_manager_detect
_docker_install
_k3d_install
_terraform_install
_kubectl_install
```

Using Camagru:

https://github.com/Ant0wan/Camagru.git

ArgoCD:

![argocd](https://static.wixstatic.com/media/e4ff2a_7edd00616f9c4f05a2f8df63f13ecf51~mv2.png/v1/fill/w_740,h_421,al_c,q_95/e4ff2a_7edd00616f9c4f05a2f8df63f13ecf51~mv2.webp)

App:

![dev](https://static.wixstatic.com/media/e4ff2a_332637e95e8f48d5aedfb9a6e32c81e2~mv2.png/v1/fill/w_740,h_315,al_c,q_95/e4ff2a_332637e95e8f48d5aedfb9a6e32c81e2~mv2.webp)
---

`mdp` for reading md within shell

TODO:
patch configmap
```
2824 ---
2825 apiVersion: v1
2826 kind: ConfigMap
2827 metadata:
2828   labels:
2829     app.kubernetes.io/name: argocd-cmd-params-cm
2830     app.kubernetes.io/part-of: argocd
2831   name: argocd-cmd-params-cm
2832 data:
2833   server.insecure: "true"
```

patch password Secret
```
2877 apiVersion: v1
2878 kind: Secret
2879 metadata:
2880   labels:
2881     app.kubernetes.io/name: argocd-secret
2882     app.kubernetes.io/part-of: argocd
2883   name: argocd-secret
2884 stringData:
2885   admin.password: "$2a$12$ruDmhYZb.qDpBTeV9fMav.jBsGQer3TTOYZuGmBQAYZmycdnQhzOW" #passord: camesaoul
2886 type: Opaque
```






```
sudo apt install terraform
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install terraform
wget -q -O - https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash
```
