# mount

## mount memory filesystem

```
mount -t tmpfs -o size=200M none /path (example google chrome cache: /home/XXXX/.cache/google-chrome )
```

## mount iso

```
mount -t iso9660 -o ro,loop <file path to the>.iso <file path to the mount point>
```

