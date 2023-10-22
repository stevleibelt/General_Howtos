# Docker container administration

## Get ip address of container

```bash
docker inspect --format '{{ .NetworkSettings.IPAddress }}' ${CID}
```

## Create data container

```bash
docker run -v /var/volumeOne -v /var/volumneTwo busybox true
```

## Remove container

```bash
docker rm <string: container_id>
```

### Remove all containers

```bash
# ref: https://linuxhandbook.com/remove-docker-containers/
docker ps -q | xargs docker stop
docker ps -aq | xargs docker stop
```

## List all available containers

```bash
docker ps -a
```

## Link container

```bash
docker run -link container:alias <vendor>/<name>
```

The alias is needed since [environment variables](http://docs.docker.io/en/latest/use/working_with_links_names/) are prefixed with that alias.

## Establish access to data

```bash
docker run -v /container/path -name my_path <vendor>/<name>
docker run -volumens-from my_path <vendor>/<name>

docker run -v /your/local/path:/container/path <vendor>/<name>
```

