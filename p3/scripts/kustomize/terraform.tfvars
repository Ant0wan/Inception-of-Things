application = {
  namespace = "argocd",
  resources = ["../../confs/"]
  label = {
    "app.kubernetes.io/part-of" = "argocd"
  }
}
