locals {
  kubeconf_path = "~/.kube/config"

  raw_data   = jsondecode(file(pathexpand("../../p3/scripts/terraform.tfvars.json")))
  raw_values = jsondecode(file(pathexpand("../confs/gitlab.tfvars.json")))

  cluster = local.raw_data.cluster
}

module "k3d" {
  source  = "../../p3/scripts/k3d/"
  cluster = local.cluster

  ingressClass = false
}

provider "helm" {
  kubernetes {
    config_path = local.kubeconf_path
  }
}

resource "helm_release" "values" {
  name             = local.raw_values.name
  namespace        = local.raw_values.namespace
  create_namespace = local.raw_values.create_namespace
  cleanup_on_fail  = local.raw_values.cleanup_on_fail
  wait             = local.raw_values.wait
  timeout          = local.raw_values.timeout
  repository       = local.raw_values.repository
  chart            = local.raw_values.chart

  values = [
    "${file(pathexpand("../confs/values.yaml"))}"
  ]
}
