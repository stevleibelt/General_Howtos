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

# define intended command for the image when started

There can only by one "CMD" in the dockerfile. If there are multiple, the last CMD will be used.
By default, everything is executed in "/bin/sh -c".

    CMD command parameter_one parameter_n

Run your command without a shell.

    CMD ["/full/qualified/path/to/command", "parameter_one", "parameter_n"]

# trigger command when container starts

There can only be one "ENTRYPOINT" in the dockerfile. If there are multiple, the last ENTRYPOINT will be used.

    # just say hello
    ENTRYPOINT echo "there is no foo without a bar"
    ENTRYPOINT ["echo", "there is no foo without a bar"]

    # start service
    ENTRYPOINT ["systemctl", "start", "httpd"]

# set user id

    USER <user>

# set working directory

Sets the working directory for RUN, CMD and ENTRYPOINT and can be used multiple times.

    WORKDIR /path/to/work/dir

# run commands as different user

    ENTRYPOINT ["/bin/bash", "my_script.sh"]
    USER <user>

# expose ports (listen on them)

    EXPOSE 8080

# add directories and content to image

    ADD realtive/path/from/build/context /absolute/path/to/image

# adapt environment

This instruction sets the environment variable to the given value.

    ENV PATH $PATH:/add/your/directory

# provide volume

    VOLUME ["/root/path", "/second/volume"]

Create a named datacontainer with volumes shares (true is the smallest program you can run).

    docker run -v /var/volume/1 -v /var/volume/2 -name DATA busybox true

Then you can mount that volumne in your application container.

    docker run -t -i -rm -volumes-from DATA -name application ubuntu bash

## mount a host directory as a container volumne

    docker run -t -i -v /host/dir:/container/dir:[rw|ro]    #rw read/write, ro read only
