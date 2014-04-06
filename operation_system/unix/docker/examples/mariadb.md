# WORK IN PROGRESS

# create dockerfile

touch Dockerfile
cat > Dockerfile <<EOF
# DOCKER-VERSION 0.9.1
# VERSION 0.0.1

FROM datt/datt-archlinux

MAINTAINER Stev Leibelt <artodeto@bazzline.net>

RUN pacman -Syyu --noconfirm
RUN pacman -S --noconfirm mariadb mariadb-clients

EXPOSE 3306

CMD ["/usr/bin/mysqld_safe"]
EOF

# build container

    sudo docker build -t stevleibelt/example-archlinux-mariadb .
    sudo docker run --name mariadb -d stevleibelt/example-archlinux-mariadb

# cleanup

    docker rmi stevleibelt/example-archkinux-mariadb

# links

* https://github.com/steeve/docker-lemp
* https://github.com/Painted-Fox/docker-php5-stack
* https://github.com/rwheaton/coreos-docker-lemp
* https://github.com/DominicBoettger/docker-aegir-mariadb
* https://github.com/Keybits/keybits-mariadb
* https://github.com/hans-d/docker-mariadb
* https://github.com/corpick/docker-mariadb
* https://github.com/Painted-Fox/docker-mariadb
* http://txt.fliglio.com/2013/11/creating-a-mysql-docker-container/
