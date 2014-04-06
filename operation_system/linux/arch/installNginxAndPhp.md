# install

pacman -S nginx php-fpm php-cgi

# setup

useradd http
groupadd http

mkdir -p /srv/http/demo
chown -R http:http /srv/http
chmod -R 750 /srv/http
chmod -R g+s /srv/http
mkdir /etc/nginx/sites-available
mkdir /etc/nginx/sites-enabled

vim /etc/nginx/nginx.conf

    #put following line at the end of your file but before final "}"
    include /etc/nginx/sites-enabled/*;

vim /etc/nginx/sites-available/demo.local

    server {
        listen      80;
        server_name demo.local;
        root    /srv/http/demo;
        index   index.html index.htm index.php;

        location ~ .php$ {
            fastcgi_split_path_info ^(.+.php)(/.+)$;
            fastcgi_pass unix:/run/php-fpm/php-fpm.sock;
            fastcgi_index index.php;
            include fastcgi.conf;
        }
    }

ln -s /etc/nginx/sites-available/demo.local /etc/nginx/sites-enabled/demo.local

vim /etc/php/php-fpm.conf

    listen = /run/php-fpm/php-fpm.sock

vim /etc/php/php.ini

    #add :/src/http/ to 'open_basedir' if needed

systemctl restart php-fpm
systemctl restart nginx

echo '<?php phpinfo(); ?>' > /srv/http/demo/index.php

# links

* http://www.homecomputerlab.com/nginx-php-mariadb-wordpress-on-archlinux-on-a-raspberry-pi
* http://wiki.nginx.org/Configuration
* http://rasberrypibeginnersguide.tumblr.com/post/27283563130/nginx-php5-on-raspberry-pi-debian-wheezy
