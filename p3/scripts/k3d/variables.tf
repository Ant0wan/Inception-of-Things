variable "cluster_name" {
  default = ["abarthel"]
  type    = list(string)
}

variable "cluster_port" {
  default = 6550
  type    = number
}

variable "cluster_ip" {
  default = "0.0.0.0"
  type    = string
}

variable "host_lb_port" {
  default = null
  type    = number
}

variable "cluster_lb_port" {
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
