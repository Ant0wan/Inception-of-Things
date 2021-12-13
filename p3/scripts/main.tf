module "k3d" {
  source  = "./k3d"
  cluster = var.cluster
}

module "kustomize" {
  source = "./kustomize"
  #	for_each = var.applications
  #	application = each.key
  application = var.applications.argocd
}
