provider "kustomization" {
  kubeconfig_path = "~/.kube/config"
}

locals {
  namespace   = "argocd"
  label_key   = "app.kubernetes.io/part-of"
  label_value = ["argocd", "dev"]
}

data "kustomization_overlay" "argocd" {
  namespace = local.label_value[0]

  common_labels = {
    (local.label_key) = local.label_value[0]
  }

  resources = [
    "../../confs/${local.label_value[0]}/"
  ]

  kustomize_options = {
    load_restrictor = "none"
  }
}

resource "kustomization_resource" "argocd" {
  for_each = data.kustomization_overlay.argocd.ids

  manifest = data.kustomization_overlay.argocd.manifests[each.value]
}

data "kustomization_overlay" "dev" {
  namespace = local.label_value[1]

  common_labels = {
    (local.label_key) = local.label_value[1]
  }

  resources = [
    "../../confs/${local.label_value[1]}/"
  ]

  kustomize_options = {
    load_restrictor = "none"
  }
}

resource "kustomization_resource" "dev" {
  for_each = data.kustomization_overlay.dev.ids

  manifest = data.kustomization_overlay.dev.manifests[each.value]
}
