# Redis

## examples

If nothing else is told, I assume you are logged in with your redis client.

### Log in with to your redis

```
#via socket
redis-cli -s ~/.redis/sock
```

### List available databases

```
CONFIG GET databases
```

### Select database

```
#you get the index from CONFIG GET databases
#there is a hidden index 0
SELECT <index>
#get the size
DBSIZE
```

### List keys per database

```
INFO keyspace
```

### Search for keys

```
redis-cli --scan --pattern "my_pattern_*"
```

### Truncate or flush database

```
#current one
FLUSHDB
#all
FLUSHALL
```

### Monitoring

```
redis-cli --stat
```

```
#inside the redis cli
#@see: https://redis.io/commands/info
INFO

#@see: https://redis.io/commands/monitor
MONITOR
```

## Link

* [Dashboard for queues with x-ray.](https://horizon.laravel.com/)
* [Rediscli](https://redis.io/topics/rediscli)

