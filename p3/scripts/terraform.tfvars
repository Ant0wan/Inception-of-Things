applications = {
  argocd = {
    name = argocd,
    namespace = "argocd",
    resources = "../../confs/argocd/",
    label = {
      key       = "app.kubernetes.io/part-of",
      value     = "argocd"
    },
  },
  app = {
    name = camagru,
    namespace = "argocd",
    resources = "../../confs/dev/",
    label = {
      key       = "app.kubernetes.io/part-of",
      value     = "dev"
    }
  }
}
