# Inception of Things

## Content

• Part 1: K3s on Vagrant
• Part 2: Three simple apps on K3s
• Part 3: K3d with Argo CD
vagrant init centos/8
vagrant up
vagrant ssh
vagrant box list
vagrant box remove <tag>
vagrant destroy
vagrant reload
vagrant up --provider=libvirt
export VAGRANT_DEFAULT_PROVIDER=libvirt
no need for natdnsproxy1 cause libvirt already use /etc/hosts of the host
