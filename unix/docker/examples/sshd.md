# create dockerfile

touch Dockerfile
cat > Dockerfile <<EOF
# DOCKER-VERSION 0.9.1
# VERSION 0.0.1

FROM datt/datt-archlinux

MAINTAINER Stev Leibelt <artodeto@bazzline.net>

RUN pacman -Syyu
RUN pacman -S --noconfirm openssh
RUN echo 'root:screencast' |chpasswd

EXPOSE 22
CMD /usr/bin/sshd -D
EOF

# build image

    sudo docker build -rm -t stevleibelt/example-archlinux-sshd .

# run image

    sudo docker run -d -P -name sshd stevleibelt/example-archlinux-sshd

# fetch port

    docker port <container_id> 22

# connect

    ssh root@<localip> -p <port_from_above>

# clean up

    docker stop <container_id>
    docker rm <container_id>
    docker rmi stevleibelt/example-archkinux-sshd
