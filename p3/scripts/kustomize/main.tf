provider "kustomization" {
  kubeconfig_path = "~/.kube/config"
}

locals {
  label_key = "app.kubernetes.io/part-of"
  label_value = "argocd"
}


data "kustomization_overlay" "argocd" {
  namespace = "argocd"

  common_labels = {
    (local.label_key) = local.label_value
  }

  resources = [
    "../../confs/argocd/"
  ]

  kustomize_options = {
    load_restrictor = "none"
  }
}

resource "kustomization_resource" "argocd" {
  for_each = data.kustomization_overlay.argocd.ids

  manifest = data.kustomization_overlay.argocd.manifests[each.value]
}
