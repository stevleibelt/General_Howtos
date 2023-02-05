# Docker and supervisor

## General

Supervisor is usefull if you want to run more than one process in and container.
You can achive this by creating run shell scripts or by using a process management tool like supervisor.

## Create a supervisord.conf

As example it is assumed that you want to run an apache and a ssh daemon in the container.

```bash
cat > supervisord.conf <<EOF
[supervisord]
nodaemon=true

[program:sshd]
command=/usr/bin/sshd -D

[program:apache2]
command=bin/bash -c "source /etc/apache2/envvars && exec /usr/sbin/apache2 -DFOREGROUND"
EOF
```

## Add to your dockerfile

```bash
RUN pacman -S --no-confirm supervisor
RUN mkdir -p /var/log/supervisor

ADD suervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 22 80

CMD ["/usr/bin/suervisord"]
```

## Build container

```bash
sudo docker build -t stevleibelt/archlinux-supervisor .
```

## Run container

```bash
sudo docker run -p 22 -p 80 -t -i stevleibelt/archlinux-supervisor
```

## Cleanup

```bash
docker rmi stevleibelt/archlinux-supervisor
```

## Links

* http://docs.docker.io/en/latest/examples/using_supervisord/
* http://supervisord.org/

