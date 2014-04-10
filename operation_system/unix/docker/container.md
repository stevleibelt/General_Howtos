# get ip address of container

    docker inspect --format '{{ .NetworkSettings.IPAddress }}' ${CID}

# create data container

    docker run -v /var/volumeOne -v /var/volumneTwo busybox true

# remove container

    docker rm <container_id>

# list all available containers

    docker ps -a

# link container

    docker run -link container:alias <vendor>/<name>

The alias is needed since [environment variables](http://docs.docker.io/en/latest/use/working_with_links_names/) are prefixed with that alias.

# establish access to data

    docker run -v /container/path -name my_path <vendor>/<name>
    docker run -volumens-from my_path <vendor>/<name>

    docker run -v /your/local/path:/container/path <vendor>/<name>
