# smbfs

## mount

cifs should be the preferred way.

### smbclient

```
smbclient \\\\<hostname|ip address>\\foldername -U <username>
```

### smbfs

```
mount -t smbfs //<hostname|ip address>/foldername mountpoint -o username=<username>
```

### cifs

```
mount -t cifs //<hostname|ip address>/foldername mountpoint -o username=<username>
```

