# general

Get all commands by calling "docker" or "docker info".
Docker is server and client.

## start docker server

systemctl start docker

## get list of images running on your local host

docker images

## search for an image

docker search <string>

## get image

docker pull <vendor>/<image>

## push image

docker push <vendor>/<image>

## get running containers

docker ps

## get informations about container

docker inspect <container_id>

## get container id

docker ps -l

## run command

docker run <vendor>/<image> <command> [<argument_one> [<argument_...> [<argument_n>]]]

### run shell (sh as example)

docker run -i -t <vendor> /bin/sh

### install software

docker run <vendor>/<image> pacman -S <software>

## save image status

docker commit [options] <container_id> [repository [tag]]

# links

* https://www.docker.io/gettingstarted/
* https://www.docker.io/learn/dockerfile/
* http://docs.docker.io/en/latest/use/basics/
* http://docs.docker.io/en/latest/terms/image/
* http://docs.docker.io/en/latest/examples/
