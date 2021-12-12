variable "applications" {
  description = "Map of applications configuration deployed by argocd."
  type        = map(any)
}
