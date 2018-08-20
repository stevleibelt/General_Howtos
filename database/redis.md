# examples

If nothing else is told, I assume you are logged in with your redis client.

## log in with to your redis

```
#via socket
redis-cli -s ~/.redis/sock
```

## list available databases

```
CONFIG GET databases
```

## select database

```
#you get the index from CONFIG GET databases
#there is a hidden index 0
select <index>
#get the size
dbsize
```

## list keys per database

```
INFO keyspace
```

## search for keys

```
redis-cli --scan --pattern "my_pattern_*"
```

## truncate or flush database

```
#current one
FLUSHDB
#all
FLUSHALL
```

## monitoring

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

# link

* [Dashboard for queues with x-ray.](https://horizon.laravel.com/)
* [Rediscli](https://redis.io/topics/rediscli)
