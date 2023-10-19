#!/bin/bash

DOCKER_IMAGE_NAME='debian_cronjob'

IS_IMAGE_AVAILABLE=$(docker image ls | grep -c ${DOCKER_IMAGE_NAME})

if [[ ${IS_IMAGE_AVAILABLE} -lt 1 ]];
then
    echo ":: Building docker image >>${DOCKER_IMAGE_NAME}<<."
    docker image build -t ${DOCKER_IMAGE_NAME} .
fi

echo ":: Run following command to login."
echo "   docker container exec -it debian_cronjob bash"

echo ""
echo ":: If you want to remove stuff."
echo "   docker-compose rm"

docker-compose up
