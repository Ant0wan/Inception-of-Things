output "clusters_created" {
  value = var.k3d_cluster_name
}
output "k3d_cluster_ip" {
  value = var.k3d_cluster_ip
}
output "k3d_host_lb_port" {
  value = local.host_lb_port
}
output "k3d_api_port" {
  value = var.k3d_cluster_port
}
