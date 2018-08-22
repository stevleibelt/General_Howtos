# network

The libnetwork is dockers implementation of the Container [Network model (CNM)](https://github.com/docker/libnetwork/blob/master/docs/design.md).
A sandbox is an isolated network stack with ethernet interfaces, ports, routing tables and DNS configuration.
A endpoint is a virtual network interface responsible for making connections (e.g. a real network).
A network is an implementation of the 802.1d bridge which groups and isolates a collection of endpoints for communication purpose.

Default linux network drivers are `bridge`, `overlay` and `macvlan`.

```
#list networks
docker network ls
#list detailed information
docker network inspect
#create network
docker network create
#delete network
docker network rm
#delete all unused networks
docker network prune
```

## single host bridged networks

* exists on one host
* can only be accessed by containers on this one and same host
* is a bridge (layer 2 switch)

```
#create a network called skynet
docker network create
    -d bridge skynet

#check that it is created
docker network ls | grep skynet
#and use build in bridge control
##ATTANTION, the default docker bridge
## does not support name resolution via
## the Docker DNS service.
##All user defiend bridges do.
brctl show
#or log into a container and do
ip a

#connect a container to the network
docker container run
    [-d]
    [--name my_container_name]
    --network skynet
    [--publish <host port>:<container port>]    #map host port to a container port
    <image_name>[:<tag_name>]

#verify port mapping with
docker port <conainer name or id>
```

## overlay networks

* exists on multipe hosts
* span a single network over multiple hosts
* containers from multiple hosts can communication with each other
* is a layer 2 network
* scale well
* works good starting with linux kernel 4.4
* is, by default, only shared and used by the swarm managers
* will be extended to the workers when a container is started
* uses [VXLANE](https://en.wikipedia.org/wiki/Virtual_Extensible_LAN) (UDP Port 4789, Virtual Bridge like Br0)

```
#create one
docker network create
    -d overlay <name of the network>
    -o encrypted [adds usage of TLS to the data)
#create one with two subnets
##results in two virtual bridges/switches Br0 and Br1 (for e.g.)
docker network create
    -d overlay <name of the network>
    --subnet=10.1.1.0/24
    --subnet=11.1.1.0/24
```

## macvlan

* connect the container to existing hosts
* performance is good
* doesn't require any port mappings or additional bridges
* works only if your network card is in promiscuous mode (not available and doable by default)
* called "transparent" driver on windows

```
#create one
docker network create
    -d macvlan
    --subnet=10.0.0.0/24
    --ip-range=10.0.00/25   #has to be reseverd for docker and not used by other nodes or a DHCP server
    --gateway=10.0.0.1
    -o parent=eth0.100  #the [sub-]interface on the host to use
    macvlan100
```

## service discovery

* container can discover each other by their network name (--name or --net-alias)
* works within the same network
* uses dockers embedded DNS server and DNS resolver
* can be manipulated with
    * --dns=<ip of an alternative dns server>
    * --dns-search=<name of an alternative dns resolver>

# link

* [10 Examples of how to get Docker Container IP Address - 2015-05-10](http://networkstatic.net/10-examples-of-how-to-get-docker-container-ip-address/)
