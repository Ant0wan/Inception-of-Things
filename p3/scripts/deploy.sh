#!/usr/bin/env bash
cd ./k3d
terraform init
terraform plan
while ! (kubectl get pods -A 2>/dev/null);
do
	sleep 1
done
cd ../kubernetes
terraform init
terraform plan
