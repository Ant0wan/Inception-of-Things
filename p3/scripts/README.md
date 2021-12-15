https://registry.terraform.io/providers/kbst/kustomization/latest/docs


Dependencies between modules: https://gcloud.devoteam.com/blog/creating-dependencies-between-your-terraform-modules/

Argocd basics: https://argo-cd.readthedocs.io/en/stable/operator-manual/declarative-setup/


TODO:
patch configmap
```
2824 ---
2825 apiVersion: v1
2826 kind: ConfigMap
2827 metadata:
2828   labels:
2829     app.kubernetes.io/name: argocd-cmd-params-cm
2830     app.kubernetes.io/part-of: argocd
2831   name: argocd-cmd-params-cm
2832 data:
2833   server.insecure: "true"
```

patch password Secret
```
2877 apiVersion: v1
2878 kind: Secret
2879 metadata:
2880   labels:
2881     app.kubernetes.io/name: argocd-secret
2882     app.kubernetes.io/part-of: argocd
2883   name: argocd-secret
2884 stringData:
2885   admin.password: "$2a$12$ruDmhYZb.qDpBTeV9fMav.jBsGQer3TTOYZuGmBQAYZmycdnQhzOW" #passord: camesaoul
2886 type: Opaque
```
