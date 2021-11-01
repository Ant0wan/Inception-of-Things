sudo dnf install vagrant-libvirt
sudo dnf install @vagrant
sudo systemctl enable libvirtd

sudo dnf install qemu-kvm libvirt libguestfs-tools virt-install rsync
sudo systemctl enable --now libvirtd
sudo vagrant plugin install vagrant-libvirt

echo '
Vagrant.configure("2") do |config|
...
  config.vm.provider :libvirt do |libvirt|
    libvirt.driver = "qemu"
  end
...
end
'
sudo gpasswd -a ${USER} libvirt
newgrp libvirt
