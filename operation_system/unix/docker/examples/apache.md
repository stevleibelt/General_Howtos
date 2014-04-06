# WORK IN PROGRESS

# create dockerfile

touch Dockerfile
cat > Dockerfile <<EOF
# DOCKER-VERSION 0.9.1
# VERSION 0.0.1

FROM datt/datt-archlinux

MAINTAINER Stev Leibelt <artodeto@bazzline.net>

RUN pacman -S --noconfirm apache

EXPOSE 80

ENTRYPOINT ["/usr/bin/redis-server"]
EOF

# links

* https://github.com/splitbrain/docker-phpfarm
* https://github.com/aestik/amp
* https://github.com/jacksoncage/apache-docker
* https://github.com/thomaswelton/docker-apache
* https://github.com/thestonefox/docker-apache
* https://github.com/gvangool/docker-apache2
