# convert virtual box image to qemu image

```
#convert to raw format
#this can take a lot of disk space
#for vdi
VBoxManage clonehd --format RAW <my image>.vdi <my image>.raw
#for vmdk
VBoxManage clonehd --format RAW <my image>.vmdk <my image>.raw

#and convert to qcow2
qemu-img convert -f raw <my image>.raw -O qcow2 <my image>.img
```

# links

* https://wiki.archlinux.org/index.php/QEMU
* https://en.wikibooks.org/wiki/QEMU/Images
* https://kuther.net/content/convert-virtualbox-kvmqemu
