# download current version
curl -s https://getcomposer.org/installer | php
# create directory
sudo mkdir -p /usr/local/bin/composer
# install composer
sudo cp composer.phar /usr/local/bin/composer/
