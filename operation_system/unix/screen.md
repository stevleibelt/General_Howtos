# start new screen session

```
screen
```

# list available screen sessions

```
screen -ls
```

# detache a running screen session

```
screen -d [<session identifier>]
```

# reattach to existing screen session or list available sessions

```
screen -r [<session identifier>]
#if your screen session is locked, or still marked as attached, detach it first
screen -d -r [<session identifier>]
```

# kill screen session without reattaching it

```
screen -S <session identifier> -X quit
```

# detach 

```
"CRTL+A +d"
```

# kill 

```
"CRTL+A +K"
```

# links

* http://www.tecmint.com/screen-command-examples-to-manage-linux-terminals/
