provider "kustomization" {
  kubeconfig_path = "~/.kube/config"
}

locals {
  namespace   = "argocd"
  label_key   = "app.kubernetes.io/part-of"
  label_value = ["argocd", "dev"]
}

data "kustomization_overlay" "app" {
  namespace = var.app.namespace

  common_labels = {
    (var.label_key) = local.label_value[0]
  }

  resources = [
    "../../confs/"
  ]

  kustomize_options = {
    load_restrictor = "none"
  }
}

resource "kustomization_resource" "app" {
  for_each = data.kustomization_overlay.argocd.ids

  manifest = data.kustomization_overlay.argocd.manifests[each.value]
}
