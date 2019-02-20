# API kickstart

```
#get available repositories
curl -v -X GET http://<hostname>:<port>/v2/_catalog

#get available images for each repository 
curl -v -X GET http://<hostname>:<port>/v2/<repository name>/tags/list

#get digist of an image
curl -s -I -X HEAD -H 'Accept: application/vnd.docker.distribution.manifest.v2+json' http://<hostname>:<port>/v2/<repository name>/manifests/<tag name> | sed -n 's/Docker-Content-Digest://p'

#delete image
#check that the digest/reference is available, e.g. for latest tag
#this is not really possible
#check: https://github.com/docker/distribution
curl -v -X DELETE http://<hostname>:<port>/v2/<repository name>/manifests/<digest>
```

# clean up registry

```
#inside your container
#dry run
/bin/registry garbage-collect --dry-run /etc/docker/registry/config.yml
#do it
/bin/registry garbage-collect /etc/docker/registry/config.yml
```

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

* [docker registry API v2](https://docs.docker.com/registry/spec/api/#listing-repositories)
* [create your own docker image hub/registry](https://docs.docker.com/registry/#basic-commands)
* [Secure a Docker Registry Using SSL (with Let's Encrypt) - 2018-06-04](https://dzone.com/articles/secure-a-docker-registry-using-ssl)
* [Docker in Production - Launch Private Registry with SSL](https://www.katacoda.com/courses/docker-production/launch-private-registry)
* [docker hub vs creating docker registry - 2018-05-21](https://code-maze.com/docker-hub-vs-creating-docker-registry/)
* [Fix >>http: server gave HTTP response to HTTPS client<<](https://stackoverflow.com/questions/38695515/can-not-pull-push-images-after-update-docker-to-1-12#38716311)
* [Test an insecure registry.](https://docs.docker.com/registry/insecure/)
