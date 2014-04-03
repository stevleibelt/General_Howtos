# create dockerfile

touch Dockerfile
cat > Dockerfile <<EOF
# DOCKER-VERSION 0.9.1
# VERSION 0.0.1

FROM datt/datt-archlinux

MAINTAINER Stev Leibelt <artodeto@bazzline.net>

RUN pacman -S --noconfirm redis

EXPOSE 6379

ENTRYPOINT ["/usr/bin/redis-server"]
EOF

# build redis container

    sudo docker build -t stevleibelt/example-archlinux-redis .
    sudo docker run --name redis -d stevleibelt/example-archlinux-redis

# link to our application container

    sudo docker run --link redis:db -i -t datt/datt-archlinux /bin/bash

# install redis on new container to get redis-cli

    pacman -Syyu
    pacman -S --noconfirm redis
    systemctl stop redis

    env | grep DB_

    redis-cli -h $DB_PORT_6379_TCP_ADDR
    set docker awesome
    get docker
    exit

# cleanup

    docker rmi stevleibelt/example-archkinux-redis
