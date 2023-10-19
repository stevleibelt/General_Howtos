# Installation on debain (9 while writing)

## docker

```
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
echo "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee -a /etc/apt/sources.list.d/docker.list
apt-get update
apt-get -y install docker-ce
systemctl enable docker
systemctl start docker
systemctl status docker
```

## docker compose

```
#note, you should check frequently if there is a newer version available
curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
```

## Link

* [How to install docker on debian 9](https://www.itzgeek.com/how-tos/linux/debian/how-to-install-docker-on-debian-9.html)
* [Install Docker Compose](https://docs.docker.com/compose/install/)

