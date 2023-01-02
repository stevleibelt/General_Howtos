# Supvervisord

## Basic usage

```bash
#show status
supervisorctl status

#reload configuration
supervisorctl reread

#apply updated configuration to running services
supervisorctl update

#start a service
supervisorctl start my-service

#stop a service
supervisorctl stop my-service

#remove a service
supervisorctl remove my-service

#tail service logs
#type >>supervisorctl tail<< to get a list of all available options
supervisorctl tail my-deamon
```

## Link

* [supervisord](http://supervisord.org/)

