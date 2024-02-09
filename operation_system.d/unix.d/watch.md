# Watch

Maybe [inotifywait](inotifywait.md) could solve your problem better.

## Synopsis

```bash
watch [-dhv] [-n <seconds>] [--differences[=cumulative]] [--help] [--interval=<seconds>] [--version] <command>  
```

## Examples

### Watch used disk space

```bash
watch du -sh
```

### Watch complex command

```bash
watch 'ls -halt | head'
```

### Watch content of a file starting with line 40

```bash
watch 'more +40 myFile'
```

### Watch after each 30 seconds

```bash
watch -n 30 uname -r
```

### Highlight differences

```bash
watch -d ls -halt
```
