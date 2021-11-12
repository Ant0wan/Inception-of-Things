#!/usr/bin/env bash
set -e
VERSION='6.1.28'
TMP='/tmp'
_package_manager_detect() {
	command -v apt &>/dev/null && pk="apt" && return
	command -v yum &>/dev/null && pk="yum" && return
	_error "No supported package manager installed on system"
	_error "(supported: apt or yum)"
	exit 1
}
_package_manager_detect
#	command -v apt &>/dev/null && pk="apt" && PKG="virtualbox-6.1_${VERSION}-147628~Ubuntu~eoan_amd64.deb" && return
#	command -v yum &>/dev/null && pk="yum" && PKG="VirtualBox-6.1-${VERSION}_147628_fedora33-1.x86_64.rpm" && return
#echo ${pk} $PKG
#sudo ${pk} update
#sudo ${pk} install vagrant
#[ -e ${TMP}/${PKG} ] || wget https://download.virtualbox.org/virtualbox/${VERSION}/${PKG} -O ${TMP}/${PKG}
#sudo ${pk} install ${TMP}/${PKG}
