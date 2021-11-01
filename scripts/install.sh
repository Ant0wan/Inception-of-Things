#!/usr/bin/env bash
set -e
_package_manager_detect() {
	command -v apt &>/dev/null && pk="apt" && return
	command -v yum &>/dev/null && pk="yum" && return
	_error "No supported package manager installed on system"
	_error "(supported: apt or yum)"
	exit 1
}
_package_manager_detect
sudo ${pk} update
sudo ${pk} install vagrant
#VERSION='6.1.28'
#PKG="VirtualBox-6.1-${VERSION}_147628_fedora33-1.x86_64.rpm"
#TMP='/tmp'
#[ -e ${TMP}/${PKG} ] || wget https://download.virtualbox.org/virtualbox/${VERSION}/${PKG} -O ${TMP}/${PKG}
#sudo ${pk} install ${TMP}/${PKG}
