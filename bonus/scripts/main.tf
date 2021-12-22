module "k3d" {
  source  = "../../p3/scripts/k3d/"
  cluster = local.cluster
}

resource "local_file" "kube_config" {
  content  = module.k3d.kube_config
  filename = "${path.module}/kube_config"
}

provider "helm" {
  kubernetes {
    config_path = local_file.kube_config.filename
  }
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
