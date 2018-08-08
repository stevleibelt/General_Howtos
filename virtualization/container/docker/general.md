# general

Get all commands by calling "docker" or "docker info".
Docker is server and client.

## start docker server

```
systemctl start docker
```

## get list of images running on your local host

```
docker images
```

## search for an image

```
docker search <string>
```

## get image

```
docker pull <vendor>/<image>
```

## push image

```
docker push <vendor>/<image>
```

## get running containers

```
docker ps
```

## get informations about container

```
docker inspect <container_id>
```

## get container id

```
docker ps -l
```

## run command

```
docker run <vendor>/<image> <command> [<argument_one> [<argument_...> [<argument_n>]]]
```

### run shell (sh as example)

```
docker run -i -t <vendor> /bin/sh
```

### install software

```
#example for an arch linux
docker run <vendor>/<image> pacman -S <software>
```

## save image status

```
docker commit [options] <container_id> [repository [tag]]
```

## where is stuff stored (path)

```
#inside the path below, cat a file prefixed with repository
cd /var/lib/docker
```

# links

* [reference manual](http://docs.docker.io/en/latest/reference/)
* [container tutorials](http://containertutorials.com/)
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
* [Creating a MySQL Docker Container](http://txt.fliglio.com/2013/11/creating-a-mysql-docker-container/)
* [Scalable Database with auto-sharding](https://crate.io/)
* [cheat sheet](https://ma.ttias.be/docker-cheat-sheet/)
* [nginx with http2](https://ma.ttias.be/run-nginx-proxy-docker-container-http2/)
* [docker on FreeBSD](https://wiki.freebsd.org/Docker)
* [portainer - open source management ui](https://portainer.io/install.html)
* [create your own docker image hub/registry](https://docs.docker.com/registry/#basic-commands)
* cool images
    * [ampache](https://hub.docker.com/r/ampache/ampache/)
    * [readymedia-transcode](https://hub.docker.com/r/mdouchement/readymedia-transcode/)
    * [rygel](https://hub.docker.com/r/tomsotte/rygel/)
    * [subsonic](https://hub.docker.com/r/hurricane/subsonic/)
