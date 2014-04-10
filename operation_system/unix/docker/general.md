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

* [reference manual](http://docs.docker.io/en/latest/reference/)
* [getting started](https://www.docker.io/gettingstarted/)
* [dockerfile](https://www.docker.io/learn/dockerfile/)
* [docker file best practices - 1](http://crosbymichael.com/dockerfile-best-practices.html)
* [docker file best practices - 2](http://crosbymichael.com/dockerfile-best-practices-take-2.html)
* [basics](http://docs.docker.io/en/latest/use/basics/)
* [lates docker build](http://docs.docker.io/en/latest/terms/image/)
* [examples](http://docs.docker.io/en/latest/examples/)
* [images](http://index.docker.io/)
* [german docker howto](http://www.heise.de/developer/artikel/Anwendungen-mit-Docker-transportabel-machen-2127220.html)
* [german dockerfile howto](http://www.heise.de/developer/artikel/Mit-Docker-automatisiert-Anwendungscontainer-erstellen-2145030.html)
* [stackoverflow](http://stackoverflow.com/search?q=docker)
# [docker on twitter](http://twitter.com/getdocker/)
* [the docker guidebook](http://kencochrane.net/blog/2013/08/the-docker-guidebook/)
