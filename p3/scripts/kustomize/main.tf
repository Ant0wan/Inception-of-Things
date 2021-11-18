provider "kustomization" {}

data "kustomization" "argocd" {
  provider = kustomization
  path = "../../confs/argocd/"
}

resource "kustomization_resource" "argocd" {
  provider = kustomization
  for_each = data.kustomization.argocd.ids
  manifest = data.kustomization.argocd.manifests[each.value]
}

resource "null_resource" "dev_envsubst" {
  depends_on = [
    kustomization_resource.argocd
  ]
  provisioner "local-exec" {
    command = "envsubst XXXX.yaml"
    interpreter = ["bash"]
    environment = {
      namespace = "bar"
      BAR = 1
      BAZ = "true"
    }
  }
}


#resource "null_resource" "kustomize" {
#  depends_on = [
#    null_resource.cluster
#  ]
#  provisioner "local-exec" {
#    command = "kustomize build ${var.kustomization_path} | kubectl apply -f -"
#    interpreter = ["bash"]
#  }
#}


