# Installation

```
sudo su

pacman -S podman
cat >> /etc/subuid <<DELIM
<username>:200000:165536
DELIM

cat >> /etc/subgid <<DELIM
<groupname>:200000:165536
DELIM

sysctl --all --pattern user_namespaces user.max_user_namespaces = 28633
#or
echo "user.max_user_namespaces=28633" > /etc/sysctl.d/userns.conf
```

# Usage

```
#run a wordpress container
podman run --name mypress -p 8080:80 -d wordpress
podman stop mypress
podman rm mypress
```

```
#run containers in a pod
#create a pod
podman pod create --name wp_pod --publish 8080:80

#add the database container
podman run --detach --pod wp_pod --restart=always -e MYSQL_ROOT_PASSWORD="badpassword0" -e MYSQL_DATABASE="wp_db" -e MYSQL_USER="tux" -e MYSQL_PASSWORD="badpassword1" --name=wp_db mariadb

#add wordpres container
podman run --detach --restart=always --pod=wp_pod -e WORDPRESS_DB_NAME="wp_db" -e WORDPRESS_DB_USER="tux" -e WORDPRESS_DB_PASSWORD="badpassword1" -e WORDPRESS_DB_HOST="127.0.0.1" --name mypress wordpress
```

# Links

* How Tos
    * [An Introduction to Podman](https://www.baeldung.com/podman-intro) - 20200720
    * [From Docker Compose to Kubernetes with Podman](https://www.redhat.com/sysadmin/compose-kubernetes-podman) - 20210128
    * [Painless services: implementing serverless with rootless Podman and systemd](https://www.redhat.com/en/blog/painless-services-implementing-serverless-rootless-podman-and-systemd) - 20210121
    * [Podman managing container pods.](https://developers.redhat.com/blog/2019/01/15/podman-managing-containers-pods/) - 20190115
