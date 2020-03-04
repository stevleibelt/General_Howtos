# df - report file system disk space usage

```
#just outputs used and available column
df --output=used,avail <path>

#just fetch the number for used
#   tail is removing the headline
df --output=used <path> | tail -n +2
```
