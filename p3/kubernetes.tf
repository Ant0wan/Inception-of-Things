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

resource "null_resource" "argocd_manifest" {
 provisioner "local-exec" {
   command = "kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml"
 }
 depends_on = [
   kubernetes_namespace.p3_namespaces
 ]
}

#resource "kubernetes_deployment" "p3_deployments" {
#  metadata {
#    name = "name"
#    labels = {
#      test = "MyExampleApp"
#    }
#  }
#
#  spec {
#    replicas = 3
#
#    selector {
#      match_labels = {
#        test = "MyExampleApp"
#      }
#    }
#
#    template {
#      metadata {
#        labels = {
#          test = "MyExampleApp"
#        }
#      }
#
#      spec {
#        container {
#          image = "nginx:1.7.8"
#          name  = "example"
#
#          resources {
#            limits = {
#              cpu    = "0.5"
#              memory = "512Mi"
#            }
#            requests = {
#              cpu    = "250m"
#              memory = "50Mi"
#            }
#          }
#
#          liveness_probe {
#            http_get {
#              path = "/nginx_status"
#              port = 80
#
#              http_header {
#                name  = "X-Custom-Header"
#                value = "Awesome"
#              }
#            }
#
#            initial_delay_seconds = 3
#            period_seconds        = 3
#          }
#        }
#      }
#    }
#  }
#}
