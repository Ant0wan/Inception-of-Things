module "k3d" {
  source  = "./k3d"
  cluster = var.cluster
}

#module "kustomize" {
#	source  = "terraform-aws-modules/vpc/aws"
#	version = "2.66.0"
#	for_each = var.applications
#}
