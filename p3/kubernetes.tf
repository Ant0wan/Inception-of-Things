provider "kubernetes" {
  config_path    = var.kubeconfig
}

resource "kubernetes_namespace" "namespaces" {
  for_each = toset(var.namespaces)
  metadata {
    name = each.key
  }
}
