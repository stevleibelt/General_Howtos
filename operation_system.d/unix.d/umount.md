# Umount

## Error solving

### target is busy

**Caution**, the solution can result in errors.

The commands below disrupt running proceess and may cause data loos **or** corrupt open files.

```bash
#always cd out of the paths you want to umount
cd

#try to unmount busy targets
umount -l /path/to/busy/device
#or
umount -f /path/to/busy/network/filesystem
```

Another way would be to detect and kill the processes that are using this path.

```bash
lsof | grep '<string: mountpoint>'

pkill <int: process_id>

umount <string: mountpoint>
```

