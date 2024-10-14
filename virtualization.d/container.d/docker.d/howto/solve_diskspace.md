# Docker solve diskspace

## Gain knowledge about system

```bash
# Get general idea if there is space left to reclaim
docker system df

# list stopped containers
docker ps -a --filter "status=exited"

# list unused images
docker images -f "dangling=true"

# list unused volumes
docker volume ls -f "dangling=true"

# list unused networks
docker network ls
```

## Remove unused data

```bash
# remove unused/stopped containers
docker container prune

# remove unused/untagged (dangling) images
docker image prune

# remove unused network
docker network prunce

# remove unused volumes
docker volume prunce

# remove all dangling data
docker system prune
# remove all unused data
docker system prune -a
```

