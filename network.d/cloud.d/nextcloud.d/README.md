# Nextcloud generale notes

## Update from command line

Nextcloud has come a long way for the following one liner.

```bash
php updater/updater.phar
```

## Setup redis as memory cacheing

```bash
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

## Enable server side encryption

One big remark, no backup, no sympathy.

```bash
# Tested on nextcloud 31.0.2
# ref: https://github.com/nextcloud/server/issues/51066#issuecomment-2692810220

php public/occ app:enable encryption
php public/occ encryption:enable
php public/occ encryption:encrypt-all
```

## Disable server side encryption

One big remark, no backup, no sympathy.

```bash
# Tested on nextcloud 31.0.0
# ref: https://github.com/nextcloud/server/issues/51066#issuecomment-2692810220

# for each user
php public/occ encryption:decrypt-all <string: user_name>
rm -fr data/<string: user_name>/files_encryption
rm -fr data/<string: user_name>/encryption_migration_backup*

# on time
php public/occ encryption:disable
php public/occ app:disable encryption
```

## Update from 20.x to 22.x

"The old server-side-encryption format is enabled. We recommend disabling this. For more details see the documentation."

```
#@see: https://github.com/nextcloud/server/issues/24240
#@see: https://docs.nextcloud.com/server/latest/admin_manual/issues/general_troubleshooting.html#problems-when-downloading-or-decrypting-files
#login to your nextcloud path via shell
#check current state
php occ encryption:scan:legacy-format

#do the update
php occ encryption:migrate-key-storage-format

#fix things
php occ files:cleanup
php occ files:repair-tree
php occ files:scan --all

#check
php occ encryption:status
```

## Link

* [nextcloud](https://nextcloud.com/)
* [nextcloudpi](https://ownyourbits.com/nextcloudpi/)
    * [how to install NextCloudPi](https://github.com/nextcloud/nextcloudpi/wiki/How-to-install-NextCloudPi)
    * [How to setup a raspberry pi nextcloud server - 2017-06-25.](https://pimylifeup.com/raspberry-pi-nextcloud-server/)
* [German: Nextcloud Installationsanleitung](https://www.c-rieger.de/nextcloud-installationsanleitung/) - 2020-06-22

