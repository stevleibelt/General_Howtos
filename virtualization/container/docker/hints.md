# Docker hints

## Keep containers alive during daemon downtime

```bash
#/etc/docker/daemon.json
{
  "live-restore": true
  "log-driver": "syslog",
  "userland-proxy": false
}
```

## Bind docker to host/port or unix socket

```bash
docker -H tcp://[host][:port]
docker -H unix://path
```

## Links

* http://docs.docker.io/en/latest/use/basics/

