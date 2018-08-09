# docker and deploying applications with docker stacks

* provides:
    * desired state
    * rolling updates
    * simple
    * scalling operations
    * health checks
    * rollbacks
* whole infrastructure is written in one docker-stack.yml file includes
    * images/services
    * volumes
    * networks
    * secrets
* build on top of docker swarm
* stacks are grouped and managed services
* services are grouped and managed containers
* example stack file can be found [here](https://github.com/dockersamples/atsea-sample-shop-app)
* can only be deployed in docker swarm mode
* to have different environments (development, test, stage and production), you have to maintain one stack file per environment

```
#example file
##has to be higher than "3.0"
##@see: https://docs.docker.com/compose/compose-file/
version: "3.x"

services:
    web_server:
        #all builds have to be pre build
        ##you can not link to a docker file
        image: my_vendor/my_web_server_container_image
        ports:
            #short form for using ingress mode
            - "80:80"
            - "443:443"
            #long form for host mode
            #long form is preferred but needs at least version 3.2
            - target: 12345
              published: 12345
              mode: host
        secrets:
            - source: web_server_key
              target: web_server_key
            - source: web_server_cert
              target: web_server_cert
    database_server:
        image: my_vendor/my_database_server_container_image
        environment:
            #environemnt/shell variables set
            ##way better -> pass them into a secrets and use this
            DATABASE_USER: toor
            DATABASE_PASSWORD_FILE: /run/secrets/database_password
            DATABASE_DATABASE: my_database
        networks:
            - backend_network
        secrets:
            - database_password
        deploy:
            placement:
                constraints:
                    #ensures that replicas of this service will
                    ##always and only run on workers and not on managers
                    #also available
                    #node labels
                    ##node.id ==
                    ##node.hostname ==
                    ##node.role != manager
                    #engine labels
                    ##engine.lables.operatingsystem=ubunto 17.04
                    #custom node lables
                    ##node.labels.zone == prod1
                    - "node.role == worker"
    application_server:
        image: my_vendor/my_application_server_container_image
        networks:
            - frontend_network
            - backend_network
            - payment_gateway
        deploy:
            replicas: 4
            update_config:
                parallelism: 2  #update two replicas at once
                failure_action: rollback #other options: pause, continue
            placement:
                constraints:
                    - "node.role == worker"
            restart_policy:
                condition: on-failure
                delay: 5s   #wait five seconds before next try
                max_attemps: 3  #try three times
                window: 120s    #wait 120 seconds before checking if restart was successful
        secrets:
            - database_password
    log_server
        image: my_vendor/my_log_server_container_image
        ports:
            - "8008:8000"
        stop_grace_periode: 2m45s   #wait 165 seconds after sending SIGTERM before sending SIGKILL
        volumes:
            - "/srv/mounted/nfs_share:/data"    #mounts /srv/mounted/nfs_share as /data
    payment_gateway:
        image: my_vendor/my_payment_gateway_server_container_image
        placement:
            constraints:
                - "node.labels.mylable == yes"

networks:
    frontend_network:
    backend_network:
    payment_network:
        driver: overlay
        driver_opts:
            encrypted: "yes"    #encrypt also data

#needs to be created on the swarm manager node
##docker secret create ...
##docker secret ls
#gets mounted into the containers as regular file
##under /run/secrets
secrets:
    #short form for same name
    database_password:
        external: true  #must exist before the stack can be deployed
    web_server_key:
    web_server_cert:
    #long form different name
    - source: application_token
      target: my_cool_name_token
```

```
#setup infrastructure and deploy this stack
##create n hosts
docker swarm init
##repeat following step until you have reached
## your number of hosts
docker swarm join --token ....
##check all is working
docker node ls
#add a custom lable
docker node update
    --label-add mylable=yes <host name>
##check
docker node inspect <host name>

#copy/paste the stack with all mandatory files
# on the docker swarm manager
# this command is also used to redeploy a stack
docker stack deploy
    -c <docker stack configuration file>
    <name of the stack>

#list stacks on the system
docker stack ls

#detailed information
docker stack ps <stack name>

#need more information?
docker service logs <service name/service id or replica id>
    [--follow]
    [--tail]
    [--details]

#remove a stack
# secrets and volumes won't be deleted
docker stack rm <stack name>
```
