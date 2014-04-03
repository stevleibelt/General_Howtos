# prepare node.js app

## create application directory

    mkdir hello_world

## create package.json

```bash
touch hello_world/package.json
cat > hello_world/package.json <<EOF
{
    "name": "docker-archlinux-node.js",
    "private": true,
    "version": "0.0.1",
    "description": "node.js hello world app on archlinux using docker",
    "author": "stev leibelt <artodeto@bazzline.net>",
    "dependencies": {
        "express": "3.2.4"
    }
}
EOF
```

## create index.js

```bash
touch hello_world/index.js
cat > hello_world/index.js <<EOF
//header
var express=require('express');

//constants
var PORT = 8080;

//app
var app = express();

app.get('/', function (request, response) {
    response.send('Hello World\n');
});
app.listen(PORT);
console.log('Running on http://localhost:'+PORT);
EOF
```

# prepare docker

## create dockerfile

```bash
touch Dockerfile
cat > Dockerfile <<EOF
# DOCKER-VERSION 0.9.1
# VERSION 0.0.1

# choose base image
FROM bcbcarl/archlinux

# install applications
RUN pacman -S --noconfirm nodejs

# create directory for application
ADD ./hello_world

# install application dependencies
RUN cd /hello_world; npm install

# expose port 8080
EXPOSE 8080

# run node for application
ENTRYPOINT ["node", "hello_world/index.js"]
EOF
```

# build image

    sudo docker build -t stevleibelt/example-archlinux-node.js .

# run image

    sudo docker run -p 49160:8080 -d -t stevleibelt/example-archlinux-node.js

# test

## get container port

    sudo docker ps

## query node application

    curl -i localhost:<port>

# cleanup

    docker rmi stevleibelt/example-archkinux-node.js
