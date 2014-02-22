#!/bin/bash

cd /tmp
curl -sS https://getcomposer.org/installer | php
sudo mkdir -p /opt/php-composer
sudo mv composer.phar /opt/php-composer
sudo ln -s /opt/php-composer/composer.phar /usr/local/bin/composer
