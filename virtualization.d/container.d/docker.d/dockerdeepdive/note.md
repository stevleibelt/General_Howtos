# notes

## docker configuration

```
#/etc/docker/daemon.json
#see /var/lib/docker/<storage driver>
#you have to restart the docker deamon
# each time you make changes here
{
    "debug": true,  #enable debugging/logging
    "log-driver": "journald",   //syslog, splunk, gelf
    "log-level": "debug",   //debug, info, warn, error, fatal
    "storage-driver": "overlay2"
}
```

# docker volumes and persistent data

* non persistent data is deleted when the container is deleted
* persistent data is managed by volumes
* default workflow, create a volume, create a container, mount the volume into the container
* when used with --mount for dealing with docker containers, docker either creates a new or uses an existing volume (identified by the name)

```
#create one
docker volume create <name of the volume>
    #block storage: high performance for small block random access
    #file storage: high performance for regular work load
    #object storage: good for long term storage of large data that do not change frequently
    [-d <one of the 25 volume drivers available as plugins or local as default]
#list
docker volume ls
#inspect
docker volume inspect <name of the volume>
#delete all currently not mounted volumes
docker volume prune
#delete one volume
docker volume rm <name of the volume>
```
