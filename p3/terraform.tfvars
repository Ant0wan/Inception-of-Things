cluster_name = ["k3d"]
cluster_port = 6550
cluster_ip = "127.0.0.1"
cluster_lb_port = 80
host_lb_port = 8080
server_count = 1
agent_count = 1
k3s_version = "v1.19.8-k3s1"

kubeconfig = "~/.kube/config"
namespaces = ["argocd", "dev"]
