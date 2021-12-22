provider "helm" {
  kubernetes {

    config_path = module.k3d.kube_path
  }
}

module "k3d" {
  source  = "../../p3/scripts/k3d/"
  cluster = local.cluster
}

locals {
  raw_data = jsondecode(file(pathexpand("../../p3/scripts/terraform.tfvars.json")))
  cluster  = local.raw_data.cluster

  raw_values = jsondecode(file(pathexpand("../confs/gitlab.tfvars.json")))
}

resource "helm_release" "values" {
  name       = local.raw_values.name
  repository = local.raw_values.repository
  chart      = local.raw_values.chart

  values = [
    "${file(pathexpand("../confs/values.yaml"))}"
  ]
}
