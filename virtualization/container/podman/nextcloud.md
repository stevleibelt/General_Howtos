# Howto Nextcloud

## Initial Setup

```
#create network
podman network create nextcloud-network
podman network ls
podman network inspect nextcloud-network

#create volumes
podman volume create nextcloud-application
podman volume create nextcloud-data
podman volume create nextcloud-database
podman volume ls
podman volume inspect nextcloud-application

#login
podman login docker.io

#setup database
podman run --detach \
  --env MYSQL_DATABASE=nextcloud \
  --env MYSQL_USER=nextcloud \
  --env MYSQL_PASSWORD=DB_USER_PASSWORD \
  --env MYSQL_ROOT_PASSWORD=DB_ROOT_PASSWORD \
  --volume nextcloud-database:/var/lib/mysql \
  --network nextcloud-network \
  --restart on-failure \
  --name nextcloud-database \
  docker.io/library/mariadb:10

#setup redis
podman run --detach \
    --network nextcloud-network \
    --appendonly yes \
    --name nextcloud-redis \
    docker.io/library/redis:alpine \
    redis-server --restart on-failure --requirepass REDIS_PASSWORD

#setup nextcloud
podman run --detach \
    --env REDIS_HOST="localhost" \
    --env REDIS_HOST_PASSWORD="REDIS_PASSWORD" \
    --env MYSQL_HOST=nextcloud-database.dns.podman \
    --env MYSQL_DATABASE=nextcloud \
    --env MYSQL_USER=nextcloud \
    --env MYSQL_PASSWORD=DB_USER_PASSWORD \
    --env NEXTCLOUD_ADMIN_USER=NC_ADMIN \
    --env NEXTCLOUD_ADMIN_PASSWORD=NC_PASSWORD \
    --volume nextcloud-application:/var/www/html \
    --volume nextcloud-data:/var/www/html/data \
    --network nextcloud-network \
    --restart on-failure \
    --name nextcloud-application \
    --publish 8080:80 \
    docker.io/library/nextcloud:20

#setup cron
podman run --detach \
    --volume ${HOME}/containers/nextcloud-application/html:/var/www/html:z \
    --entrypoint=/cron.sh
    --name nextcloud-cron
    docker.io/library/nextcloud:20

podman container ls
curl localhost:8080
```

## Update Containers

```
#update maria db
podman pull mariadb:10
podman stop nextcloud-database
podman rm nextcloud-database
#create it again, see setup

#update redis
podman stop nextcloud-redis
podman rm nextcloud-reids
#create it again, see setup

#update nextcloud
podman pull nextcloud:20
podman stop nextcloud
podman rm nextcloud
#create it again, see setup
```

# Links

* [Installing Nextcloud 20 on Fedora Linux with Podman](https://fedoramagazine.org/nextcloud-20-on-fedora-linux-with-podman/) - 20210215
* [Nextcloud with podman rootless containers and user systemd services. Part II - Nextcloud pod](https://www.underkube.com/posts/2021-01-28-nextcloud-podman-rootless-systemd-part-ii-nextcloud-pod/) - 20210128
