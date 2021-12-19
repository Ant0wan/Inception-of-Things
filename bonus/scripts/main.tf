provider "helm" {
  kubernetes {
    config_path = module.k3d.kube_config
  }
}

module "k3d" {
  source  = "../../p3/scripts/k3d/"
  cluster = local.cluster
}

locals {
  raw_data = jsondecode(file(pathexpand("../../p3/scripts/terraform.tfvars.json")))
  cluster  = local.raw_data.cluster
}

# Need to get value from tfvars.json and eventually put helm config in set instead of values.yaml
#resource "helm_release" "values" {
#  name = "gitlab"
#
#  repository = "https://charts.bitnami.com/bitnami"
#  chart      = "nginx-ingress-controller"
#
#  set {
#    name  = "service.type"
#    value = "ClusterIP"
#  }
#}
