provider "kubernetes" {
  config_path    = var.kubeconfig
  config_context = var.kubecontext
}

resource "kubernetes_namespace" "namespaces" {
  for_each = var.namspaces
}
