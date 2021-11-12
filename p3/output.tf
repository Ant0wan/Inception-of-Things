output "clusters_created" {
  value = var.cluster_name
}
output "cluster_ip" {
  value = var.cluster_ip
}
output "host_lb_port" {
  value = local.host_lb_port
}
output "api_port" {
  value = var.cluster_port
}
