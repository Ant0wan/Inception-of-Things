#!/usr/bin/env bash
cd k3d
terraform init
terraform apply

printf "Waiting for cluster to be up and running...\n"
sleep 30;

cd ../kustomize
terraform init
terraform plan
