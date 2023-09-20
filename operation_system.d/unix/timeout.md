# timeout

```
run a command with a time limit
```

# example

```
#usable in a cronjob for example
#run the command for 30 seconds, send a kill (HUP) as default and followed by a kill -9 if needed
#suffix can be s(econds), m(inutes), h(oures) and d(ays)
timeout -k 30s /path/to/my/command
```
