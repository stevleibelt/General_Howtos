#!/bin/bash

groupadd users

cd /tmp
curl -sS https://getcomposer.org/installer | php
sudo mkdir -p /opt/php-composer
sudo mv composer.phar /opt/php-composer
sudo chgrp -R users /opt/php-composer
sudo chmod -R g+w /opt/php-composer
sudo ln -s /opt/php-composer/composer.phar /usr/local/bin/composer
