# Docker

Get all commands by calling "docker" or "docker info".
Docker is server and client.

## Commands

```bash
# Cleanup system
# This includes all volumes
docker system prune -a --volumes

# Get list of images running on your local host
docker images

# Search for an image
docker search <string>

# Fetch a image
docker pull <vendor>/<image>

# Push image
docker push <vendor>/<image>

# Get running containers
docker ps

# Get top/statistics
docker stats

# Get informations about container
docker inspect <container_id>

# Get container id
docker ps -l

# Run command
docker run <vendor>/<image> <command> [<argument_one> [<argument_...> [<argument_n>]]]

## Run shell (sh as example)
docker run -i -t <vendor> /bin/sh

## Install software
#example for an arch linux
docker run <vendor>/<image> pacman -S <software>

# Save image status
docker commit [options] <container_id> [repository [tag]]

# Where is stuff stored (path)
#   Inside the path below, cat a file prefixed with repository
cd /var/lib/docker
```

## Links

* [Docker Best Practices for Python Developers: testdriven.io](https://testdriven.io/blog/docker-best-practices/) - 20240412
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
* cool images
    * [ampache](https://hub.docker.com/r/ampache/ampache/)
    * [readymedia-transcode](https://hub.docker.com/r/mdouchement/readymedia-transcode/)
    * [rygel](https://hub.docker.com/r/tomsotte/rygel/)
    * [subsonic](https://hub.docker.com/r/hurricane/subsonic/)
