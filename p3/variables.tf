variable "k3d_cluster_name" {
  default = ["abarthel"]
  type    = list(string)
}

variable "k3d_cluster_port" {
  default = 6550
  type    = number
}

variable "k3d_cluster_ip" {
  default = "0.0.0.0"
  type    = string
}

variable "k3d_host_lb_port" {
  default = null
  type    = number
}

variable "k3d_cluster_lb_port" {
  default = 80
  type    = number
}

variable "server_count" {
  default = 1
  type    = number
}

variable "agent_count" {
  default = 0
  type    = number
}

variable "k8s_namespaces" {
  default = ["default"]
  type    = list(string)
}
