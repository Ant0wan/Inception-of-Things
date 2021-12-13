applications = {
  argocd = {
    namesapce = "argocd"
    label = {
      key       = "app.kubernetes.io/part-of",
      value     = "argocd",
      resources = "../../confs/"
    },
  },
}

