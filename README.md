# Inception of Things

## Content

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

### Part 2: Three simple apps on K3s


### Part 3: K3d with Argo CD

`mdp` for reading md within shell
