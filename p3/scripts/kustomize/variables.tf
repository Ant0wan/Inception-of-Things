variable "application" {
  description = "Application configuration."
  type = object({
    namespace = string
    resources = list(string)
  })
}

variable "kubeconfig" {
  description = "Raw kubeconfig. creating dependency between modules."
  type        = string
}
