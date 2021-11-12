provider "kubernetes" {}

resource "kubernetes_namespace" "p3_namespaces" {
 for_each = toset(var.k8s_namespaces)
 metadata {
   name = each.key
 }
 depends_on = [
   null_resource.cluster
 ]
}
