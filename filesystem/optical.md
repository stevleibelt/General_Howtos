# create image

```
dd if=/dev/<sr0> of=/local/disk/path/to/store/the.iso
```

# verify

```
sha1sum /local/disk/path/to/store/the.iso
if=/dev/<sr0> | sha1sum
```
