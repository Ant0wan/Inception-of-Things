provider "kustomization" {
  kubeconfig_path = "~/.kube/config"
}

locals {
  label_key = "app.kubernetes.io/part-of"
  label_value = ["argocd", "dev"]

  time_ts = formatdate("YYYY-MM-DDThh:mm:ssZZZ", timestamp())

  namespace = "argocd"
}


data "kustomization_overlay" "argocd" {
  namespace = "argocd"

  common_labels = {
    (local.label_key) = local.label_value[0]
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

data "kustomization_overlay" "dev" {
  namespace = "dev"

  common_labels = {
    (local.label_key) = local.label_value[1]
  }

  resources = [
    "../../confs/dev/"
  ]

  kustomize_options = {
    load_restrictor = "none"
  }
}

resource "kustomization_resource" "dev" {
  for_each = data.kustomization_overlay.dev.ids

  manifest = data.kustomization_overlay.dev.manifests[each.value]
}
