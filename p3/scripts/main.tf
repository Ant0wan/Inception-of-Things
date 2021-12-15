module "k3d" {
  source  = "./k3d"
  cluster = var.cluster
}

module "kustomize" {
  source      = "./kustomize"
  application = var.argocd
  kubeconfig  = module.k3d.kube_config
}
