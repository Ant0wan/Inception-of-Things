
#### Execute

```shell
terraform init
```

```shell
terraform plan
```

```shell
terraform apply
```

```shell
helm upgrade --install gitlab gitlab/gitlab --timeout 600s --values=confs/values-k3d.yaml
```

https://registry.terraform.io/providers/hashicorp/helm/latest/docs

variables:
https://docs.gitlab.com/charts/installation/command-line-options.html

install:
https://docs.gitlab.com/charts/installation/deployment.html

terraform:
https://dev.to/kha7iq/installing-gitlab-on-kubernetes-with-kustomize-3ee6
