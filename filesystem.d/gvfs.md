# GVFs - GIO Virtual Filesystem

## Examples

```bash
# using gio
#   mount
gio mount smb://foo...
#   umount
gio mount -u smb://foo...
```

## Error solving

### No entry in `/run/user/$(UID)/gvfs`

* Unount your shares
* `sudo ps aux | grep gvfs`
* `sudo killall gvfs*`
* Try to mount your shares again

## Links

* [Homepage: wiki.gnome.org](https://wiki.gnome.org/Projects/gvfs) - 20231214
