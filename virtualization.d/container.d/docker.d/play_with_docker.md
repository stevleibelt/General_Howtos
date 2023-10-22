# stage 1

* [stage 1](https://training.play-with-docker.com/ops-stage1/)
* [hello](https://training.play-with-docker.com/ops-s1-hello)
* [customize](https://training.play-with-docker.com/ops-s1-images/)
* [deploy and manage](https://training.play-with-docker.com/ops-stage1/)

## 1.1 Docker container run

```
#pull a native alpine image
docker image pull alpine
#list available images
docker image ls
#run ls in the container
#for each command, a new container instance will be created
docker container run alpine ls -l
#hello world
docker container run alpine echo "hello world"
#open an interactive shell
#exit it by typing >>exist<<
docker container run -it alpine /bin/sh
#list container instances
docker container ls -a
```

## 1.2 Container isolation

```
#create a text file
docker container run -it alpine /bin/sh
#inside the container
##create a file
echo "foo" > bar.txt
##check it is there
ls
##exit
exit
#check that the file is not available on an other container
docker container run alpine ls
#start a specific container id
docker container start <id>
#execute a specific command in a specific container
docker container exec <id> ls
```

## 1.3 Terms

```
#download an image
docker image pull <name>
#find out more about an image
docker image inspect <name>
#list available images
docker image ls
Image
#a docker image is build from a series of layers
Layer
#each layer represents an instruction in the docker file
#each layer except the last one is read-only
Dockfile
#dockfile is a text file
#volumne is a special container layer to persist data
Compose
#control multiple containers on a single machine
Swarm Mode
#controlls many docker engines on different machines
Manager
#a swarm member that could be voted to be a leader
Leader
#the main control node
Worker
#simple worker node
Stack
#group of services that are deployed together
Service
#complex piece of software made up of one or multiple containers
Task
#part of a service
```

[dockfile reference](https://docs.docker.com/engine/reference/builder)

## 1.4 Image creation from a container

```
#choose your container
docker container run -ti ubuntu bash
#install some stuff/setup the container
apt-get update
apt-get install foo
echo "foobar" > foo.bar
exit
#find fitting container
docker container ls -a
#check diff
docker container diff <id>
#commit container
docker container commit <id>
#check new image was created
docker image ls
#add a tag
docker image tag <id> <tag>
#check that tag was created
docker image ls
#and now use it
docher container run <tag> <command>
```

## 1.5 Using the dockerfile

```
#vim Dockerfile
FROM alpine
RUN apk update && apk add nodejs
COPY . /application
WORKDIR /application
CMD ["node", "index.js"]
#exit
#build image
docker image build -t <tag name> .
#run it
docker container run <tag name>
```

## 1.6 Image layers

```
docker image ls
docker image history <id>
#just make some changes on your index.js file
#rebuild another version
docker image build -t <tag name> .
#check that all was working
docker image ls
docker container run <tag name>
```

## 1.7. Image inspection

```
docker image ls
docker image inspect <name>
#list the amount of used layers
docker image inspect --format "{{ json .RootFS.Layers }}" <id>
```

## 1.8 Initialize your swarm

```
#init the first swarm manager
#high availability is reached with at least three managers
docker swarm init --advertise-addr $(hostname -i)
#join to a swarm
docker warm join --token <token>
#list available swarm members
docker node ls
```

## 1.9 Deploy a stack

```
#there is a create example application available
git clone https://github.com/docker/example-voting-app
cd example-voting-app
#with an complex but readable docker-stack.yaml
cat docker-stack.yaml
#deploy a stack
docker stack deploy --compose-file=<path to the file> <name_of_the_stack>
#check that the stack is deployed
docker stack ls
#get details for the services
docker stack services <stack_name>
#list tasks of the service
docker service ps <stack_name>
#on the fly scale - has to be done on node one
docker service scale <stack_name>=<int: number of tasks>
#scale the number of containers
docker servive update --replicas 7 <stack_name>
#remove a service
docker service rm <stack_name>
#and kill container if needed on node one
docker kill <id>
#leave swarm, repeat it on all nodes
docker swarm leave --force
```

# stage 2

[stage 2](https://training.play-with-docker.com/ops-stage2/)
[seccomp](https://training.play-with-docker.com/security-seccomp/)
[capabilities](https://training.play-with-docker.com/security-capabilities/)
[networking](https://training.play-with-docker.com/docker-networking-hol/)
[orchestration](https://training.play-with-docker.com/orchestration-hol/)
[compose to swarm part 1](https://training.play-with-docker.com/orchestration-workshop-part1/)
[compose to swarm part 2](https://training.play-with-docker.com/orchestration-workshop-part2/)

## 2.1 Networking basics

```
#list available network commands
docker network
#list network
docker network ls
#inspect a network
docker network inspect
#list network driver
docker info
```

# stage 3

[stage 3](https://training.play-with-docker.com/ops-stage3/)
