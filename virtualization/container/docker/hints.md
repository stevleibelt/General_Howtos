# Docker hints

## Keep containers alive during daemon downtime

```bash
#/etc/docker/daemin.json
{
  "live-restore": true
}
```

## Bind docker to host/port or unix socket

```bash
docker -H tcp://[host][:port]
docker -H unix://path
```

## Links

* http://docs.docker.io/en/latest/use/basics/

