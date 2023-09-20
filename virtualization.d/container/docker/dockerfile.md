# Dockerfile

## General

```bash
INSTRUCTION <arguments>
```

# Define base image

```bash
FROM <vendor>/<imagename>
```

## Execute commands

```bash
RUN <command>
```

Same as 'docker run image command' + 'docker commit <container_id>'.

## Build image

use "-t <name>" to tag it while building.

### Dockerfile is in same directory

```bash
docker build .
```

### From standard in

```bash
docker build - < Dockerfile
```

### From github

```bash
docker build github.com/foo/bar
```

## Name image

```bash
docker tag <container_id> <name>
```

## Commenting

```bash
# my comment
# VERSION 1.0.0 # version of your dockfile
```

## Name maintainer

```bash
MAINTAINER Stev Leibelt <artodeto@bazzline.net>
```

## Define intended command for the image when started

There can only by one "CMD" in the dockerfile. If there are multiple, the last CMD will be used.
By default, everything is executed in "/bin/sh -c".

```bash
CMD command parameter_one parameter_n
```

Run your command without a shell.

```bash
CMD ["/full/qualified/path/to/command", "parameter_one", "parameter_n"]
```

## Trigger command when container starts

There can only be one "ENTRYPOINT" in the dockerfile. If there are multiple, the last ENTRYPOINT will be used.

```bash
# just say hello
ENTRYPOINT echo "there is no foo without a bar"
ENTRYPOINT ["echo", "there is no foo without a bar"]

# start service
ENTRYPOINT ["systemctl", "start", "httpd"]
```

## Set user id

```bash
USER <user>
```

## Set working directory

Sets the working directory for RUN, CMD and ENTRYPOINT and can be used multiple times.

```bash
WORKDIR /path/to/work/dir
```

## Run commands as different user

```bash
ENTRYPOINT ["/bin/bash", "my_script.sh"]
USER <user>
```

## Expose ports (listen on them)

```bash
EXPOSE 8080
```

## Add directories and content to image

```bash
ADD realtive/path/from/build/context /absolute/path/to/image
```

## Adapt environment

This instruction sets the environment variable to the given value.

```bash
ENV PATH $PATH:/add/your/directory
```

## Provide volume

```bash
VOLUME ["/root/path", "/second/volume"]
```

Create a named datacontainer with volumes shares (true is the smallest program you can run).

```bash
docker run -v /var/volume/1 -v /var/volume/2 -name DATA busybox true
```

Then you can mount that volumne in your application container.

```bash
docker run -t -i -rm -volumes-from DATA -name application ubuntu bash
```

## Mount a host directory as a container volumne

```bash
docker run -t -i -v /host/dir:/container/dir:[rw|ro]    #rw read/write, ro read only
```

