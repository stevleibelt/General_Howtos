# Docker compose

## Environment variables

You can add and enforce environment variables in `docker-compose.yml`.

Following a list of syntax with usecase:

* `${OPTIONAL_VARIABLE:-default}`, to define a default value if variable is unset or empty
* `${OPTIONAL_VARIABLE-default}`, to define a default value if variable is unset
* `${MANDATORY_VARIABLE:?}`, results in an error message if variable is unset or empty
* `${MANDATORY_VARIABLE?}`, results in an error message if variable is unset

## Examples

### PHP with redis and maria db

```bash
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

### Set number of conrainters for a service

```bash
#docker-compose <service name>=<number of instances>
docker-compose scale web=4
```

## Links

* https://docs.docker.com/compose/
* https://github.com/docker/compose
* https://docs.docker.com/compose/compose-file/
* https://docs.docker.com/compose/reference/
* https://docs.docker.com/compose/gettingstarted/
* https://docs.docker.com/compose/wordpress/
* https://www.safaribooksonline.com/library/view/mastering-docker/9781785287039/ch07s03.html
* [Cheatsheet: Environment variables and precedence in Docker Compose](https://www.darraghoriordan.com/2023/04/23/docker-compose-eval-env-var) - 20240111
* [Environment variables precedence in Docker Compose](https://docs.docker.com/compose/environment-variables/envvars-precedence/) - 20240111

