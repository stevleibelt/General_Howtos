# commands

```
docker image ls
docker container ls
docker system info
docker info
docker --version
docker version

#search image
docker search <pattern> [--limit <int>]
#pull image
##official repository
docker image pull <repository>:<tag>
###or by using digest
docker image pull <repository>@<digest>
##unofficial repository
docker image pull <name/repository>:<tag>
#run a bash
##-it = interactive terminal
##--restart
###always, restart when docker deamon gets started
###unless-stopped, no restart when docker deamon gets started
###on-failed, when exit code of the container is non-zero, 
#       also restart when docker daemon gets started
docker container run 
    [--name <name>] \
    [--restart always|unless-stopped|on-failed] \
    [-d #to run it in the background] \
    [-p 80:8080 #maps port host:80 to container:8080] \
    -it \
    ubuntu:latest \
    /bin/bash
#Press CTRL-PQ to exit the container without terminating it
#reattach to this
docker container exec -it <name or id> bash
#stop container
docker container stop <name or id>
#remove it
docker container rm <name or id>
#remove all containers, use with caution!
docker container rm $(docker container ls -aq) -f
#remove all images, use with caution!
docker image rm $(docker image ls -q) -f

#containerizing an application
#you can use the following as demo repository
#https://github.com/nigelpoulton/psweb
#build image
docker image build -t <tag like name:version> <path to the docker file, regulary .>
    [--no-cache=true]
    [--squash]
#run a container
docker container run -d --name <name like web1> --publish 8080:8080 <tag like name:version>
#delete all orphaned images
docker image prune
#push image
docker login
#referes to docker.io/user_name/image_name:tag_name
docker image push <user_name/image_name:tag_name>

#check the logs
docker container logs

#list available networks
docker network ls

#inspect network
docker network inspect <driver> #e.g. bridge

#list available volumes
docker volume ls
```
