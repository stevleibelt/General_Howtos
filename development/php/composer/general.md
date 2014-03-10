# install only required packages

composer update --no-dev 

# install also development packages

composer update [--dev ]

# update only one package (plus its dependencies)

composer update <vendor>/<product>

# update composer.lock (after adding description/doing unimportant changes to composer.json)

composer update --lock

# update composer.json with composer

composer require "<vendor>/<product>:0.0.1"

# create composer.json with composer

composer init

## without interactive questions

composer init -n

## with dependency

composer init --requre=<vendor>/<product>:0.0.1

# fork project with composer

composer create-project <vendor>/<product> path 0.0.1

# links

* https://getcomposer.org/
* http://composer.json.jolicode.com/
* http://moquet.net/blog/5-features-about-composer-php/
