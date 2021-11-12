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


#sudo dnf -y install wget
#wget http://download.virtualbox.org/virtualbox/rpm/fedora/virtualbox.repo
#sudo mv virtualbox.repo /etc/yum.repos.d/virtualbox.repo
#sudo dnf install -y gcc binutils make glibc-devel patch libgomp glibc-headers  kernel-headers kernel-devel-`uname -r` dkms
#sudo dnf install -y VirtualBox-6.1
#sudo usermod -a -G vboxusers ${USER}
#sudo /usr/lib/virtualbox/vboxdrv.sh setup
#cd
#wget https://download.virtualbox.org/virtualbox/6.1.22/Oracle_VM_VirtualBox_Extension_Pack-6.1.22.vbox-extpack
## Install Vagrant
#sudo sudo dnf -y install vagrant

# https://developer.fedoraproject.org/tools/vagrant/vagrant-virtualbox.html

#dnf install -y gcc libvirt libvirt-devel libxml2-devel make ruby-devel libguestfs-tools
#export CONFIGURE_ARGS="with-libvirt-include=/usr/include/libvirt with-libvirt-lib=/usr/lib64"
#vagrant plugin install vagrant-libvirt
#
#
#
#sudo dnf install vagrant-libvirt
#sudo dnf install @vagrant
#sudo systemctl enable libvirtd
#
#sudo dnf install qemu-kvm libvirt libguestfs-tools virt-install rsync
#sudo systemctl enable --now libvirtd
#sudo vagrant plugin install vagrant-libvirt
#
#echo '
#Vagrant.configure("2") do |config|
#...
#  config.vm.provider :libvirt do |libvirt|
#    libvirt.driver = "qemu"
#  end
#...
#end
#'
#sudo gpasswd -a ${USER} libvirt
#newgrp libvirt

#vagrant plugin install vagrant-vbguest
#vagrant plugin install vagrant-vbguest --plugin-version 0.21
