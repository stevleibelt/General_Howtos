# examples

## php with redis and maria db

```
#@see: https://hub.docker.com/_/php/
application:
  command: php -S 0.0.0.0:5000 -t /var/www/html
  image: php:5.6-cli
  links:
    - database
    - redis
  ports:
    - 5000:5000
  restart: always
  volumes:
    - ./application:/var/www/html
#@see: https://hub.docker.com/_/mariadb/
database:
  environment:
    MYSQL_ROOT_PASSWORD: toor
    MYSQL_DATABASE: application
    MYSQL_USER: user
    MYSQL_PASSWORD: resu
  image: mariadb:10.1.11
  ports:
    - 3306:3306
  restart: always
  volumes:
    - ./database:/var/lib/mysql
#@see: https://hub.docker.com/_/redis/
redis:
  image: redis

#docker-compose up
#open http://0.0.0.0:5000 in your webbrowser
```

## set number of conrainters for a service

    #docker-compose <service name>=<number of instances>
    docker-compose scale web=4

# links

* https://docs.docker.com/compose/
* https://github.com/docker/compose
* https://docs.docker.com/compose/compose-file/
* https://docs.docker.com/compose/reference/
* https://docs.docker.com/compose/gettingstarted/
* https://docs.docker.com/compose/wordpress/
