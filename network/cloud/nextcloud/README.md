# Howto

## Setup redis as memory cacheing

```
cd <path of your nextcloud instance>/config
cp config.php config.php.<yyyymmdd>
#add the following lines to your config.php

    'memcache.distributed' => '\\OC\\Memcache\\Redis',
    'memcache.locking' => '\\OC\\Memcache\\Redis',
    'memcache.local' => '\\OC\\Memcache\\APCu',
    'redis' =>
    [
        'host' => '/sockets/redis.socket',
        'port' => 0,
        'password' => '[PASSWORD]', //if needed
        'timeout' => 1.5
    ]
```

# Link

* [nextcloud](https://nextcloud.com/)
* [nextcloudpi](https://ownyourbits.com/nextcloudpi/)
    * [how to install NextCloudPi](https://github.com/nextcloud/nextcloudpi/wiki/How-to-install-NextCloudPi)
    * [How to setup a raspberry pi nextcloud server - 2017-06-25.](https://pimylifeup.com/raspberry-pi-nextcloud-server/)
* [German: Nextcloud Installationsanleitung](https://www.c-rieger.de/nextcloud-installationsanleitung/) - 2020-06-22
