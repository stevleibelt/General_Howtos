# docker images

An image can has childs or parents.
Current image and its parents are forming a layer.
A layer is a read-only image. An image never changes.

# download a pre built image

```
sudo docker pull busybox
sudo docker pull bcbcarl/archlinux
```

# build image

```
sudo docker build --rm --tag="<vendor|username>/<imagename>"
```

* --rm   -   remove intermediate containers
* --tag    -   buildtag

# run image

```
sudo docker run bcbcarl/archlinux
```

* -d    -   run as daemon
* -p    -   expose port

## run shell in image

```
sudo docker run -i bcbcarl/archlinux /bin/bash
```

## hello world

```
sudo docker run bcbcarl/archlinux /bin/echo hello world
```

## hello world daemon

### start daemon

```
CONTAINER_ID=$(sudo docker run -d bcbcarl/archlinux /bin/sh -c "while true; do echo hello world; sleep 1; done")
```

* docker run -d - run as daemon

### check logs manually

```
sudo docker logs <container id>
```

### attach to container

```
sudo docker attach --sig-proxy=false <container id>
```

* --sig-proxy=false -   do not forward signals to container (you can use CTRL-C to exit attachement without stopping the container)

### see daemon in process list

```
docker ps
```

### stop daemon

```
docker stop <container id>
```

# remove image

```
sudo docker rmi <vendor>/<name>
```

# remove all images

```
sudo docker ps -a -q | xargs docker rm
```

# image location on host machine

```
/var/lib/docker/graph/<id>/json
```

# simple idea to run all your needed dockers

```
#!/bin/bash
${CONTAINER_ONE} = $(docker run <container_name>)
${CONTAINER_TWO} = $(docker run <container_name>)

echo "id of container one: "${CONTAINER_ONE}  #use names like "mysql, apache, etc"
echo "id of container two: "${CONTAINER_TWO}
```

# share an image

```
#export a image.tar
docker save --output <file path>.tar <image name>
##or
docker save <image name> <file path>.tar
#import a image.tar
docker load --input <file path>.tar
##or
docker load <file path>.tar
```

# link

* [Building tiny container images - 2018-07-19](https://opensource.com/article/18/7/building-container-images)
* [Share an image](https://stackoverflow.com/a/48856787)
* [Docker: Transferring Docker Images Without Registry - 2017-11-17](https://medium.com/@sanketmeghani/docker-transferring-docker-images-without-registry-2ed50726495f)
