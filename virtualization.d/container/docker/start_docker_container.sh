#!/bin/bash
####
# Starts a fitting container and creates image if needed.
#
# Following an example script for a php repository.
# Given is, that the script is located in <project_root>/bin.
# Given is, that the docker file exists in <project_root>/data/docker.
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2018-05-09
####

PATH_OF_THIS_SCRIPT=$(cd $(dirname "$0"); pwd)
DOCKER_IMAGE_NAME='my_php_application'
DOCKER_IMAGE_TAG='0.1.0'

if ! (docker image ls | grep -q "${DOCKER_IMAGE_NAME}\s\+${DOCKER_IMAGE_TAG}")
then
    PATH_TO_THE_DOCKER_SOURCE=$(realpath ${PATH_OF_THIS_SCRIPT}/../data/docker)
    echo ":: We have to build the docker container first."
    echo ":: Please do the following steps first."
    #this is usefull since you have to copy some ssh keys to a path
    # or configure some files.

    read -p ":: Hit <ENTER> to continue."                                                                                                                       

    docker build -t ${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG} ${PATH_TO_THE_DOCKER_SOURCE}
fi

docker container run --mount type=bind,source="${PATH_OF_THIS_SCRIPT}"/..,target=/application -it ${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG} /bin/ash
