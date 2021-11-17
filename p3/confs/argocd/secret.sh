# admin.password: camesaoul
kubectl -n argocd patch secret argocd-secret \
  -p '{"stringData": {
    "admin.password": "$2a$12$ruDmhYZb.qDpBTeV9fMav.jBsGQer3TTOYZuGmBQAYZmycdnQhzOW",
    "admin.passwordMtime": "'$(date +%FT%T%Z)'"
  }}'
