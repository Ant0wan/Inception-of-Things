provider "kustomization" {
  kubeconfig_path = "~/.kube/config"
  kubeconfig_raw = module.gke_example.kubeconfig
}

data "kustomization_overlay" "application" {
  namespace = var.application.namespace

  resources = var.application.resources

  kustomize_options = {
    load_restrictor = "none"
  }
}

resource "kustomization_resource" "app" {
  for_each = data.kustomization_overlay.application.ids

  manifest = data.kustomization_overlay.application.manifests[each.value]
}
