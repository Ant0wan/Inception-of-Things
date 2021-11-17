#!/usr/bin/env bash
cd k3d
terraform init
terraform plan

cd ../kustomize
terraform init
terraform plan
