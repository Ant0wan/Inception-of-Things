#!/usr/bin/env bash
set -e
command -v k3d || exit 1
command -v terraform || exit 1
command -v kubectl || exit 1
cd ../
terraform init
terraform apply
