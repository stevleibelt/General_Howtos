# WORK IN PROGRESS

# create dockerfile

```bash
touch Dockerfile
cat > Dockerfile <<EOF
# DOCKER-VERSION 0.9.1
# VERSION 0.0.1
# based on: https://github.com/tomparys/docker-skype-pulseaudio/blob/master/Dockerfile
# thanks for your howto!

FROM bcbcarl/archlinux

# install applications
RUN pacman -Syyu --noconfirm
RUN pacman -S --noconfirm openssh
RUN pacman -S --noconfirm skype

# create user
RUN useradd -m -d /home/docker -p 'print crypt('"docker"', "aa"),"\n"'` docker

# adapt openssh
RUN echo X11Forwarding yes >> /etc/ssh/ssh_config   #ssh_config?

# prepare ssh condfig folter
RUN mkdir -p /home/docker/.ssh
RUN chown -R docker:docker /home/docker
RUN chown -R docker:docker /home/docker/.ssh

# set locale
RUN localedef -v -c -i en_US -f UTF-8 en_US.UTF-8 || true
RUN echo "Europe/Berlin" > /etc/timezone

# create lunch wrapper
RUN echo 'export PULSE_SERVER="tcp:localhost:64713"' >> /usr/local/bin/skype-pulseaudio
RUN echo 'PULSE_LATENCY_MSEC=60 skype' >> /usr/local/bin/skype-pulseaudio
RUN chmod 755 /usr/local/bin/skype-pulseaudio

# expose ssh port
EXPOSE 22

# start ssh
ENTRYPOINT ["/usr/sbin/sshd", "-D"]

EOF
```

# links

* https://wiki.archlinux.org/index.php/Skype#Docker
* https://github.com/shofetim/docker-skype/blob/master/Dockerfile
