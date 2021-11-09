#!/usr/bin/env bash
systemctl start firewalld
systemctl enable firewalld

common_ports=('22/tcp' '80/tcp' '443/tcp' '2376/tcp' '8472/udp' '9099/tcp' '10250/tcp' '10254/tcp' '30000-32767/tcp' '30000-32767/udp')
server_ports=('6443/tcp')

for p in ${common_ports[@]}; do
	firewall-cmd --permanent --add-port=$p
done
if [ -e /var/lib/rancher/k3s/server/node-token ]; then
	for p in ${server_ports[@]}; do
		firewall-cmd --permanent --add-port=$p
	done
fi

firewall-cmd --reload
