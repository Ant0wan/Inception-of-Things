output "clusters_created" {
  value = var.cluster.name
}

output "cluster_ip" {
  value = var.cluster.ip
}

output "host_lb_port" {
  value = local.host_lb_port
}

output "api_port" {
  value = var.cluster.port
}

output "kube_config" {
  value = data.local_file.kubeconfig.content
}
