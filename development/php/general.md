# start php [internal web server](http://php.net/manual/en/features.commandline.webserver.php)

## basic example

```shell
cd path/to/your/project
php -S localhost:<port>	#default is 8000
```
## specify a different document root

```shell
php -S localhost:8000 -t path/to/the/document/root
```

## specify a unique php.ini

```shell
php -S localhost:8000 -c php.ini
```

## get environment informations

### version

```
php -v
```

### modules / extensions

```
php -m
```

### information

```
php -i
```

# links

* http://www.tuxradar.com/practicalphp
* http://appserver.io/
* https://github.com/fzaninotto/Faker
* https://github.com/nelmio/alice
* http://www.tools4noobs.com/
