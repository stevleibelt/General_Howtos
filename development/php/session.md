# using filesystem

```
PHP will lock session files for each request and maintain that lock until you do a session_write_close() or the script terminates/exits. The side effect of this is that all requests become serial, since they're all contending for the same single resource (the session file).
```
[source](https://stackoverflow.com/questions/3623484/why-does-apache-not-process-multiple-requests-from-the-same-browser-simultaneous)

# using redis

* install redis-server redis-tools redis-sentinel
* sudo pecl install redis
* start redis server

## setup inside the application

```php
ini_set('session.save_handler', 'redis');
//if you have only one redis server
ini_set('session.save_path', 'tcp://127.0.0.1:6379');
//if you have multiple redis servers
ini_set('session.save_path', 'tcp://1.2.3.4:6379?timeout=0.5,tcp://1.2.3.5:6379?timeout=0.5');
//optional
ini_set('session.name', 'my_application_session_id.<environment>');

session_start();
```

* use "redis-cli" with the command "monitor" to see what is going on

# links

* http://www.sitepoint.com/saving-php-sessions-in-redis/
* http://joshtronic.com/2013/06/20/redis-as-a-php-session-handler/
* https://github.com/TheDeveloper/redis-session-php
* https://github.com/milqmedia/MQRedisSessionStorage
* https://github.com/opis/session
* https://github.com/romeOz/rock-session
