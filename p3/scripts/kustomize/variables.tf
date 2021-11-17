#variable "kustomization_path" {
#  default = "confs/argocd"
#  type    = string
#}

#variable "namespaces" {
#  default = ["argocd", "dev"]
#  type    = list(string)
#}

variable "argocd_conf_path" {
  default = "../../confs/argocd/"
  type    = string
}
