variable "k8s_namespaces" {
  default = ["default"]
  type    = list(string)
}

variable "kube_config" {
  default = "~/.kube/config"
  type    = string
}
