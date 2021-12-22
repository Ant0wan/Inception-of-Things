resource "random_integer" "port" {
  min = 8000
  max = 8099
}

locals {
  kube_path    = "~/.kube/config"
  host_lb_port = (var.cluster.host_lb_port != "" ? var.cluster.host_lb_port : random_integer.port.result)
}

resource "null_resource" "cluster" {
  for_each = toset(var.cluster.name)
  triggers = {
    agent_count  = var.cluster.agent_count
    server_count = var.cluster.server_count
    ip           = var.cluster.ip
    port         = var.cluster.port
  }
  provisioner "local-exec" {
    command = "k3d cluster create ${each.key} --agents ${var.cluster.agent_count} --servers ${var.cluster.server_count} --api-port ${var.cluster.ip}:${var.cluster.port} --port ${local.host_lb_port}:${var.cluster.lb_port}@loadbalancer"
  }
}

resource "null_resource" "cluster_delete" {
  for_each = toset(var.cluster.name)
  provisioner "local-exec" {
    command = "k3d cluster delete ${each.key}"
    when    = destroy
  }
}

data "docker_network" "k3d" {
  for_each = toset(var.cluster.name)
  depends_on = [
    null_resource.cluster
  ]
  name = "k3d-${each.key}"
}

data "local_file" "kubeconfig" {
  filename = pathexpand(local.kube_path)
  depends_on = [
    null_resource.cluster
  ]
}
