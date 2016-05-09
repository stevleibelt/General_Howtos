# how to install grub

## if currently booted by a live cd

```
mount root (and if available boot) partition under /mnt (/mnt/boot)
grub-install --root-directory=/mnt /dev/<device>
```

## else

```
grub-install /dev/<device>
```

# where is what stored

## entries

```
/etc/grub.d/
```

## configuration

```
/etc/default/grub
```

### disable submenu

```
GRUB_DISABLE_SUBMENU=y
```

### change default menu entry

```
GRUB_DEFAULT=0
```

# how to build build

grub-mkconfig

# links

* https://wiki.archlinux.org/index.php/GRUB/Tips_and_tricks
