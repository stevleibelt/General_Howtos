# sychronize cached writes to persistent storage

## to trigger a system wide sychronization

```
sync
```

## to trigger a device specific sychronizatrion

```
blockdev --flushbufs /dev/<your device>
```
