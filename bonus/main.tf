module "k3d" {
	source = "../p3/scripts/k3d/"
}

provider "helm" {
  kubernetes {
    config_path = module.k3d.kube_config
  }
}

#
#module "gitlab" {
#
#  provider "helm" {
#    kubernetes {
#      config_path = "~/.kube/config"
#    }
#  }
#
#
#
#
#  resource "helm_release" "nginx_ingress" {
#    name = "nginx-ingress-controller"
#
#    repository = "https://charts.bitnami.com/bitnami"
#    chart      = "nginx-ingress-controller"
#
#    set {
#      name  = "service.type"
#      value = "ClusterIP"
#    }
#  }
#}
