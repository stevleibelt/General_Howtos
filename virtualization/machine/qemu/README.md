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

# examples

## arch linux arm

```
#create virtual harddisk
qemu-img create -f qcow2 archlinuxarm.img 4G
#first boot from cdrom
qemu--arm archlinuxarm.img -m 512 -cdrom arch-0.7.2-ftp.iso -boot d
#regular boot
qemu--arm archlinuxarm.img -m 512
```

# links

* https://wiki.archlinux.org/index.php/QEMU
* https://en.wikibooks.org/wiki/QEMU/Images
* https://kuther.net/content/convert-virtualbox-kvmqemu
* [resize disk image while vm is running (german)](http://www.pro-linux.de/kurztipps/2/1841/festplatten-in-qemu-online-vergr%C3%B6%C3%9Fern.html)
* [GPU passthrough howto](https://dominicm.com/gpu-passthrough-qemu-arch-linux/)
* [PCI passthrough howto](https://wiki.archlinux.org/index.php/PCI_passthrough_via_OVMF)
