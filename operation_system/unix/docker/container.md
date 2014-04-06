# create data container

docker run -v /var/volumeOne -v /var/volumneTwo busybox true

# remove container

    docker rm <container_id>

# list all available containers

    docker ps -a

# link container

    docker run -link container:prefix <vendor>/<name>

# establish access to data

    docker run -v /container/path -name my_path <vendor>/<name>
    docker run -volumens-from my_path <vendor>/<name>

    docker run -v /your/local/path:/container/path <vendor>/<name>
