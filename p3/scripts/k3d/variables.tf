variable "cluster" {
  description = "K3d cluster info map"
  type = map(object({
    name         = list(string)
    port         = number
    ip           = string
    lb_port      = number
    host_lb_port = number
    server_count = number
    agent_count  = number
  }))
  default = {
    name         = ["abarthel"]
    port         = 6550
    ip           = "0.0.0.0"
    lb_port      = 4
    host_lb_port = 80
    server_count = 1
    agent_count  = 0
  }
}
