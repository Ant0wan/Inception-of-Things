provider "kustomization" {}

data "kustomization" "confs" {
  provider = kustomization
  path     = "confs"
}

resource "kustomization_resource" "confs" {
  provider = kustomization
  for_each = data.kustomization.confs.ids
  manifest = data.kustomization.confs.manifests[each.value]
}
