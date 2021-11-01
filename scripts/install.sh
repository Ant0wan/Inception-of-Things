#!/usr/bin/env bash
sudo dnf install -y vagrant
# https://www.virtualbox.org/wiki/Linux_Downloads
VERSION='6.1.28'
PKG="VirtualBox-6.1-${VERSION}_147628_fedora33-1.x86_64.rpm"
TMP='/tmp'
[ -e ${TMP}/${PKG} ] || wget https://download.virtualbox.org/virtualbox/${VERSION}/${PKG} -O ${TMP}/${PKG}
sudo dnf install -y ${TMP}/${PKG}
