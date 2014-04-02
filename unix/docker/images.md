# docker images

An image can has childs or parents.
Current image and its parents are forming a layer.
A layer is a read-only image. An image never changes.

# download a pre built image

sudo docker pull busybox
sudo docker pull bcbcarl/archlinux

# build image

sudo docker build -t <vendor|username>/<imagename>

# run image

sudo docker run bcbcarl/archlinux

## run shell in image

sudo docker run -i bcbcarl/archlinux /bin/bash

## hello world

sudo docker run bcbcarl/archlinux /bin/echo hello world

## hello world daemon

### start daemon

CONTAINER_ID=$(sudo docker run -d bcbcarl/archlinux /bin/sh -c "while true; do echo hello world; sleep 1; done")

* docker run -d - run as daemon

### check logs manually

sudo docker logs $CONTAINER_ID

### attach to container

sudo docker attach --sig-proxy=false $CONTAINER_ID

* --sig-proxy=false -   do not forward signals to container (you can use CTRL-C to exit attachement without stopping the container)

### see daemon in process list

docker ps

### stop daemon

docker stop $CONTAINER_ID

# remove image

sudo docker rmi <vendor>/<name>
