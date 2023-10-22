# Resize hard disk

```
#if your disk is a vmdk, you first have to migrate it to vdi
VBoxManager clonemedium "source.vmdk" "target.vdi" --format vdi
#assuming you want to resize the disk to 12GB
VBoxManager modifymedium "target.vdi" --resize 12288
#now you have to options, just use the vdi disk by updating the 
#   disk in your virtual machine settings
#   or convert it back to vmdk
#anyways, you have to boot your virtual machine and choose
#   something like gparted to resize the filesystem too.
```
