applications = {
  argocd = {
    namespace = "argocd",
    resources = "../../confs/argocd/",
    label = {
      key       = "app.kubernetes.io/part-of",
      value     = "argocd"
    },
  },
  dev = {
    namespace = "argocd",
    resources = "../../confs/dev/",
    label = {
      key       = "app.kubernetes.io/part-of",
      value     = "dev"
    }
  }
}
