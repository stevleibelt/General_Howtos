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

## list keys per database

```
INFO keyspace
```

## truncate or flush database

```
#current one
FLUSHDB
#all
FLUSHALL
```
