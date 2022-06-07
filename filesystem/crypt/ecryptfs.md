# ecryptfs

## Simple

```
pacman -S ecryptfs-utils

ecryptfs-setup-private

mkdir .private private
chmod -R 770 .private
chmod -R 550 private

mount -t ecryptfs /path/to/.private /path/to/private
```

## Advanced

```
pacman -S keyutils
```

