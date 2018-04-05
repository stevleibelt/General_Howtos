# synopsis

```
watch [-dhv] [-n <seconds>] [--differences[=cumulative]] [--help] [--interval=<seconds>] [--version] <command>  
```

# watch used disk space

```
watch du -sh
```

# watch complex command

```
watch 'ls -halt | head'
```

# watch content of a file starting with line 40

```
watch 'more +40 myFile'
```

# watch after each 30 seconds

```
watch -n 30 uname -r
```

# highlight differences

```
watch -d ls -halt
```
