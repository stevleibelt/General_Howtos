# docker compose

Docker compose is fig from the acquired company "Orchard".
It is a python library you have to install separatly.

```
#example file
version: "<float>"  #version of the composer api you use, always the latest.
services:
    #each service will be one container
    my_application:
        build: .    #build a new image by tacking the Dockerfile in the current directory
        command: php application.php    #not needed if you have an ENTRYPOINT in the Dockerfile
        ports:
            - target: 5000  #map container port
              published: 5000   #to host port
        networks:
            my_application_network:
        volumes:
            - type: volume
              source: my_application_volume
              target: /source
        <...>
        restart_policy:
            condition: always | unless-stopped | on-failure
    cache-redis:
        image: "redis:alpine"
        networks:
            my_application_network:
networks:
    my_application_network:
    [driver: overlay]
    [attachable: true]
volumes:
    #use >>docker volume inspect <application_name> | grep Mountpoint<< to get it
    my_application_volume:  #volumes are in /var/lib/docker/volumes/<application_name>/_data/
secrets:
    <...>
configs:
    <...>
```

```
#start and build
docker-compose [-f my_compose_file.yml] up [-d] [&]
#restart
docker-compose restart
#stop
docker-compose stop
#stop and delete
docker-compose down
#show state
docker-compose ps
docker-compose top
```
