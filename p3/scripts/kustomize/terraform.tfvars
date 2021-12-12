applications = {
  argocd = {
    namesapce = "argocd"
    label = {
      key       = "app.kubernetes.io/part-of",
      value     = "argocd",
      resources = "../../confs/argocd/"
    },
  },
  dev = {
    namesapce = "argocd"
    label = {
      key       = "app.kubernetes.io/part-of",
      value     = "dev",
      resources = "../../confs/dev/"
    }
  }
}

