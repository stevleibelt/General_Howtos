# install

pacman -S nginx php-fpm php-cgi

# setup

useradd http
groupadd http

mkdir -p /srv/http/demo
chown http:http /src/http
chmod 750 /src/http

vim /etc/nginx/nginx.conf

    server {
        listen      80;
        server_name demo.local;

        location / {
            root    /srv/http/demo/;
            index   index.html;
        }
    }

vim /etc/php/php-fpm.conf

    listen = 127.0.0.1:9000

systemctl restart php-fpm
systemctl restart nginx

# links

* http://www.homecomputerlab.com/nginx-php-mariadb-wordpress-on-archlinux-on-a-raspberry-pi
* http://rasberrypibeginnersguide.tumblr.com/post/27283563130/nginx-php5-on-raspberry-pi-debian-wheezy
