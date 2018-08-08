# push an image

```
#first "link" it to the registry
docker tag my_image:0.0.1 my.registry.dev:5000/my_image:0.0.1
#than push it
docker push my.registry.dev:5000/my_image:0.0.1
```

# error

## http: server gave HTTP response to HTTPS client

Execute the following commands as root.
Change >>my.registry.dev<< to whatever is fitting your needs.

```
cat >> /etc/docker/daemon.json <<DELIM
{
        "insecure-registries":[
                "my.registry.dev:5000"
        ]
}
DELIM

systemctl restart docker
```

# link

* [create your own docker image hub/registry](https://docs.docker.com/registry/#basic-commands)
* [docker hub vs creating docker registry - 2018-05-21](https://code-maze.com/docker-hub-vs-creating-docker-registry/)
* [Fix >>http: server gave HTTP response to HTTPS client<<](https://stackoverflow.com/questions/38695515/can-not-pull-push-images-after-update-docker-to-1-12#38716311)
* [Test an insecure registry.](https://docs.docker.com/registry/insecure/)
