module "k3d" {
  source  = "./k3d"
  cluster = var.cluster
}

module "kustomize" {
  source = "./kustomize"
  application = var.applications.argocd
}
