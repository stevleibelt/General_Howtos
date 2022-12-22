# Kubernetes

## Architecture

All is written down in the YAML file.

### Control plane components

* Etcd
  * Distributed key-value store for persistently storing kubernetes object data
  * The only place where kubernetes stores cluster state and metadata
  * Should run in HA (3, 5, 7 ... instances)
* API server
  * Only component that interacts directly with Etcd
  * Provides consistent way of storiy objects in etcd
  * Provides RESTful API to create, update, modify or delete a resource
  * Implements a watch mechanism
* Controller Manager
  * Controllers are control loops that watch the state of the cluster
  * Each controller tries to move the cluster closer to the desired state
  * Controler examples
    * Replication manager
    * ReplicaSet, DaemonSet and Job controllers
    * Deployment controller
    * StatefulSet controller
    * Node controller
    * Service controller
    * Endpoints controller
    * Namespace controller
    * PersistentVolume controller
* Scheduler
  * Is a control plane process that assigns pods to nodes
  * Responsible for finding the best node for that pod to run on

### Worker node components

* Kubelet
  * Agent that runs on each node
  * Responsible for everything runnning on the node
* Service proxy
  * Runs on each node
  * Ensures that on pod can talk to another pod, one node to another node and one container to another container
* Container runtime
  * Lower-level container runtimes to setup namespaces and cgroups
  * Higher-level container runtimes to manage images and provide API for developers

## Links

* [Kubernete Architecture](https://opensource.com/article/22/2/kubernetes-architecture) - 20221222

