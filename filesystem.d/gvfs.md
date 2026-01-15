# GVFs - GIO Virtual Filesystem

It can happen that `gvfs-mount` is not available, but `gio mount` is.

You can use gvfs to mount an ftp, no direct need to install duck or other cli ftp clients.

## Examples

```bash
# using gio
#   mount
gio mount smb://foo...
#   same as: `gvfs-mount smb://foo...`
#   umount
gio mount -u smb://foo...
#   same as: `gvfs-mount -u smb://foo...`
```

## Error solving

### No entry in `/run/user/$(UID)/gvfs`

* Unount your shares
* `sudo ps aux | grep gvfs`
* `sudo killall gvfs*`
* Try to mount your shares again

## Links

* [Homepage: wiki.gnome.org](https://wiki.gnome.org/Projects/gvfs) - 20231214
