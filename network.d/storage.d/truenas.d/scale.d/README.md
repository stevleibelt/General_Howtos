# TrueNAS SCALE

## Services

```bash
# show all services
services --status-all

# restart a service
services middlewared restart
```

## K3b

```bash
# ref: https://www.truenas.com/community/threads/starting-and-restrting-apps-from-cli.97969/
# list available apps
k3s kubectl get pods,svc,daemonsets,deployments,statefulset,sc,pvc,ns,job --all-namespaces -o wide
k3s kubectl get deployments.apps -o json

# list state of one app/namespace
k3s kubectl get pods -n <string: app_name>
# or
k3s kubectl -n <string: app_name> get deploy

# stop or scale to zero
# k3s kubectl -n ix-jellyfin scale --replicas=0 deploy jellyfin
k3s kubectl -n <NAMESPACE> scale --replicas=0 deploy <DEPLOYMENT NAME>

# start or scale to 1
k3s kubectl -n <NAMESPACE> scale --replicas=1 deploy <DEPLOYMENT NAME>

# restart (no matter how many replicas)
k3s kubectl -n <NAMESPACE> rollout restart deploy <DEPLOYMENT NAME>
```

## Links

* [kubectl reference](https://kubernetes.io/docs/reference/kubectl/) - 20240201
* [official docs](https://www.truenas.com/docs/scale/) - 20221220
* [Setup Bridge/Make communication between vm and truenas possible - TrueNAS Scale: Ultimate Home Setup incl. Tailscale: level1techs.com](https://forum.level1techs.com/t/truenas-scale-ultimate-home-setup-incl-tailscale/186444) - 20231230
