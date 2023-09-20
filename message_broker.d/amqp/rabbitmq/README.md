# rabbitmqctl

```
#important commands
rabbitmqctl status
rabbitmqctl list_queues
rabbitmqctl list_queues <queue_name> messages_ready messages_unacknowledged
rabbitmqctl delete_queue
rabbitmqctl set_cluster_name
rabbitmqctl join_cluster
rabbitmqctl report
rabbitmqctl node_health_check
```

# link

* [rabbitmq tutorials based on amqp interop](https://blog.forma-pro.com/rabbitmq-tutorials-based-on-amqp-interop-cf325d3b4912) - 2018-08-10
* [setup a cluster](https://thoughtsimproved.wordpress.com/2015/01/03/tech-recipe-setup-a-rabbitmq-cluster-on-ubuntu/)
    * [guide how to create a cluster](https://www.rabbitmq.com/clustering.html)
    * [high available (mirrored) queues](https://www.rabbitmq.com/ha.html)
    * [parameters and policies](https://www.rabbitmq.com/parameters.html)
    * [cluster formation and peer discovery](https://www.rabbitmq.com/cluster-formation.html)
    * [configuration](https://www.rabbitmq.com/configure.html)
    * [using pacemaker](https://www.rabbitmq.com/pacemaker.html)
    * [docker compose file for a master](https://github.com/micahhausler/rabbitmq-compose/blob/master/docker-compose.yml)
    * [docker compose file with a master and a few mirrors](https://github.com/bijukunjummen/docker-rabbitmq-cluster)
* [how to use rabbitmq in php](https://www.sitepoint.com/use-rabbitmq-php/) - 16.10.2014
    * [getting started with rabbitmq in php](https://www.binpress.com/tutorial/getting-started-with-rabbitmq-in-php/164) - 28.10.2014
    * [rabbitmq official tutorial part one](https://www.rabbitmq.com/tutorials/tutorial-one-php.html)
    * [rabbitmq official tutorial part two](https://www.rabbitmq.com/tutorials/tutorial-two-php.html)
* [official page](https://www.rabbitmq.com/)
* [management plugin](https://www.rabbitmq.com/management.html)
* [queueviewer](https://www.queueviewer.com/)
* [monitoring plugin](https://www.rabbitmq.com/monitoring.html)
* [list of development tools](https://www.rabbitmq.com/devtools.html)
* [redis vs. rabbitmq as message broker](https://www.minvolai.com/rabbitmq-vs-redis-as-message-brokers/) - 16.10.2013
* [rabbitmq for beginners](https://www.cloudamqp.com/blog/2015-05-18-part1-rabbitmq-for-beginners-what-is-rabbitmq.html)
