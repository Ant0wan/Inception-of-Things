resource "kubernetes_ingress_class_v1" "traefik" {
  metadata {
    name = "traefik"
  }

  spec {
    controller = "traefik.io/ingress-controller"
  }
}
