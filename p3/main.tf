provider "docker" {}
provider "random" {}

resource "random_integer" "port" {
  min = 8000
  max = 8099
}

locals {
  host_lb_port = (var.host_lb_port != "" ? var.host_lb_port : random_integer.port.result)
}

resource "null_resource" "cluster" {
  for_each = toset(var.cluster_name)
  triggers = {
    agent_count   = var.agent_count
    server_count  = var.server_count
    ip            = var.cluster_ip
    port          = var.cluster_port
    k3s_version   = var.k3s_version
  }
  provisioner "local-exec" {
    command = "k3d cluster create ${each.key} --agents ${var.agent_count} --servers ${var.server_count} --api-port ${var.cluster_ip}:${var.cluster_port} --port ${local.host_lb_port}:${var.cluster_lb_port}@loadbalancer --image rancher/k3s:${var.k3s_version}"
  }
}

resource "null_resource" "cluster_delete" {
  for_each = toset(var.cluster_name)
  provisioner "local-exec" {
    command = "k3d cluster delete ${each.key}"
    when    = destroy
  }
}

data "docker_network" "k3d" {
  for_each = toset(var.cluster_name)
  depends_on = [
    null_resource.cluster
  ]
  name = "k3d-${each.key}"
}
