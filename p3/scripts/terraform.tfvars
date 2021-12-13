cluster = {
  name         = ["abarthel"]
  port         = 6550
  ip           = "127.0.0.1"
  lb_port      = 80
  host_lb_port = 8080
  server_count = 1
  agent_count  = 2
}

applications = {
  argocd = {
    name = argocd,
    namespace = "argocd",
    resources = "../../confs/",
    label = {
      key       = "app.kubernetes.io/part-of",
      value     = "argocd"
    },
  },
}
