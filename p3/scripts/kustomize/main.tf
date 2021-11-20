provider "kustomization" {
  kubeconfig_path = "~/.kube/config"
}

locals {
  label_key = "app.kubernetes.io/part-of"
  label_value = "argocd"

  time_ts = formatdate("YYYY-MM-DDThh:mm:ssZZZ", timestamp())

  namespace = "argocd"
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

#  patches {
#    patch = <<-EOF
#      - op: add
#        path: data/server.insecure
#        value: true
#    EOF
#    target = {
#      version = "v1"
#      kind = "ConfigMap"
#      name = "argocd-cmd-params-cm"
#      namespace = local.namespace
#    }
#  }
#  patches {
### password: faitchierlapedago
#    patch = <<-EOF
#      - op: replace
#        path: stringData/admin.password
#        value: "$2a$12$XC7M9hTkoNzfS.Pbwl72MOIimmSZ1qnWrxTWi1wOgpJzGSudi0dpS"
#    EOF
#    target = {
#      version = "v1"
#      kind = "Secret"
#      name = "argocd-secret"
#      namespace = local.namespace
#    }
#  }
}

resource "kustomization_resource" "argocd" {
  for_each = data.kustomization_overlay.argocd.ids

  manifest = data.kustomization_overlay.argocd.manifests[each.value]
}
