# docker swarm

* out of the box
    * encrypted distributed cluster store
    * encrypted networks
    * mutal tls
    * secure cluster join tokes
    * PKI to ease up managing and rotating certificates
* build into docker since 1.12
* a swarm is a number of nodes
* a node is either a manager or a worker
* managers share a distributed etcd database
* managers are also acting as workers
* a swarm is running services
* a services is a container with benefits (scaling, rolling updates, simple rollbacks)
* a running services is called task or replica

Following ports needs to be open:
* 2377/tcp - secure client-to-swarm communication
* 7946/tcp - control plane gossip
* 7946/udp - control plane gossip
* 4789/udp - VXLAN-based overlay networks

```
#init a swarm and make this host the first manager
docker swarm init
    [--advertise-addr 10.0.0.1:2377]    #can even be an address of an load balancer
    [--listen-addr 10.0.0.1:2377]   #maybe different if advertise addr is a load balancer
    [--autolock]    #prevents that a restarted node can join automatically
    [--external-ca] #configure external ca, check out >>docker swarm ca --help<<
#check status
docker node ls
#fetch join token
#   depending on the token, the node either joins as worker or as manager
docker swarm join-token [manager|worker]
#add as many workers as you want to
docker swarm join [...]
#add as many managers as you want to, odd numbers is important, 3 to 5 is recommended
#   managers should be connected via reliable networks (don't mix aws with azure)
docker swarm join [...]
#rotate token
docker swarm join-token --rotate [manager|worker]
#set certificate rotation to 30 days
docker swarm update --cert-expiry 720h
#check status
docker node ls
#update stuff like enabling autolock
docker swarm update --autolock=true
#add swarm manager after restart
docker swarm unlock
```

```
#create and manage a service
docker service create
    --name <service_name>
    -p 8080:8080
    [--mode global]
    [--networkt <network_name>]
    [--publish published=80,target=80,mode=host]    #mode=[host|ingress], host = publish ports only on nodes running this service, ingress = publish port on all nodes (default), layer 4, ingress does load balancing
    [--replicas 5]
    [--log-driver journald|syslog|splunk|gelf]
    [--log-opts ?]
    <image_name>/<tag_name>
#check
docker service ls
#check more
docker service ps <service_name>
#inspect
docker service inspect --pretty <service_name>
#scale
docker service scale <service_name>=10
#remove a service
docker service rm <service_name>
#update an image within the swarm
docker service update
    --image <image_name>/<tag_name>
    --update-parallelism 4  #update four nodes in parallel
    --update-delay 30s  #wait 30 seconds before updating the next nodes
    <network_name>
#check the logs
docker service logs
    [--follow]
    [--tail]
    [--details]
```

```
#updating services and other stuff
#just create an overlay network because we can
docker network create -d overlay <network_name>
```
