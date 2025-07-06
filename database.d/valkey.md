# ValKey

ValKey is the successor of Redis. By the time of writing, all examples are working for redis too.   
Just replace `valkey` with `redis`.

## Examples

If nothing else is told, I assume you are logged in with your valkey client.

### Log in with to your valkey

```bash
#via socket
valkey-cli -s ~/.valkey/sock
```

### List available databases

```bash
CONFIG GET databases
```

### Select database

```bash
#you get the index from CONFIG GET databases
#there is a hidden index 0
SELECT <index>
#get the size
DBSIZE
```

### List keys per database

```bash
INFO keyspace
```

### List all entries in a database
```bash
valkey-cli
SELECT <int: index>
KEYS *

# from index 0 to the end, list each entry
LRANGE <string: key_name> 0 -1

# list size of a queue
# ref: https://valkey.io/commands/llen/
LLEN <string: key_name>
```

### Search for keys

```bash
valkey-cli --scan --pattern "my_pattern_*"
```

### Truncate or flush database

```bash
#current one
FLUSHDB
#all
FLUSHALL
```

### Monitoring

```bash
valkey-cli --stat

#inside the redis cli
#@see: https://valkey.io/commands/info
INFO

#@see: https://valkey.io/commands/monitor
MONITOR
```

## Link

* [Valkeycli](https://valkey.io/topics/cli/) - 20240905
