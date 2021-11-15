resource "null_resource" "kustomize" {
  depends_on = [
    null_resource.cluster
  ]
  provisioner "local-exec" {
    command = "kustomize build ${var.kustomization_path} | kubectl apply -f -"
    interpreter = ["bash"]
    environment = {
      FOO = "bar" ??
      BAR = 1
      BAZ = "true"
    }
  }
}
