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

## first loop through resources in ids_prio[0]
#resource "kustomization_resource" "argocd" {
#  for_each = data.kustomization_build.argocd.ids_prio[0]
#
#  manifest = data.kustomization_build.argocd.manifests[each.value]
#}

## then loop through resources in ids_prio[1]
## and set an explicit depends_on on kustomization_resource.p0
#resource "kustomization_resource" "p1" {
#  for_each = data.kustomization_build.test.ids_prio[1]
#
#  manifest = data.kustomization_build.test.manifests[each.value]
#
#  depends_on = [kustomization_resource.p0]
#}
#
## finally, loop through resources in ids_prio[2]
## and set an explicit depends_on on kustomization_resource.p1
#resource "kustomization_resource" "p2" {
#  for_each = data.kustomization_build.test.ids_prio[2]
#
#  manifest = data.kustomization_build.test.manifests[each.value]
#
#  depends_on = [kustomization_resource.p1]
#}


















#
#resource "kustomization_resource" "argocd_overlay" {
#  for_each = data.kustomization_overlay.argocd.ids
#
#  manifest = data.kustomization_overlay.argocd.manifests[each.value]
#}


#data "kustomization_build" "argocd" {
#  #provider = kustomization
#  path = "../../confs/argocd/"
#}
#
#resource "kustomization_resource" "argocd" {
#  #provider = kustomization
#  for_each = data.kustomization.argocd.ids
#  manifest = data.kustomization.argocd.manifests[each.value]
#}

#resource "null_resource" "dev_envsubst" {
#  depends_on = [
#    kustomization_resource.argocd
#  ]
#  provisioner "local-exec" {
#    command = "envsubst XXXX.yaml"
#    interpreter = ["bash"]
#    environment = {
#      namespace = "bar"
#      BAR = 1
#      BAZ = "true"
#    }
#  }
#}


#resource "null_resource" "kustomize" {
#  depends_on = [
#    null_resource.cluster
#  ]
#  provisioner "local-exec" {
#    command = "kustomize build ${var.kustomization_path} | kubectl apply -f -"
#    interpreter = ["bash"]
#  }
#}


