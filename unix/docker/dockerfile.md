# general

    INSTRUCTION <arguments>

# define base image

    FROM <vendor>/<imagename>

# execute commands

    RUN <command>

Same as 'docker run image command' + 'docker commit <container_id>'.

# build image

use "-t <name>" to tag it while building.

## dockerfile is in same directory

    docker build .

## from standard in

    docker build - < Dockerfile

## from github

    docker build github.com/foo/bar

# name image

    docker tag <container_id> <name>

# commenting

    # my comment
    # VERSION 1.0.0 # version of your dockfile

# name maintainer

    MAINTAINER Stev Leibelt <artodeto@bazzline.net>
