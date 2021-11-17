provider "kustomization" {}

data "kustomization" "test" {
  provider = kustomization
  path = "../../confs/argocd/"
}

resource "kustomization_resource" "test" {
  provider = kustomization
  for_each = data.kustomization.test.ids
  manifest = data.kustomization.test.manifests[each.value]
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


