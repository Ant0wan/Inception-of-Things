variable "cluster" {
  description = "K3d cluster info map"
  type = object({
    name         = list(string)
    port         = number
    ip           = string
    lb_port      = number
    host_lb_port = number
    server_count = number
    agent_count  = number
  })
  default = {
    name         = ["k3d-cluster"]
    port         = 6550
    ip           = "0.0.0.0"
    lb_port      = null
    host_lb_port = 80
    server_count = 1
    agent_count  = 0
  }
}

variable "ingressClass" {
  description = "Boolean for Traefik ingressClass."
  type        = bool
  default     = true
}
