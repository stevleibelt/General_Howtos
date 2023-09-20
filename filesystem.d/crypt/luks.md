# Create

```
# create luks container
cryptsetup --cipher aes-xts-plain64 --key-size 512 --hash sha512 --iter-time 5000 --use-random --verify-passphrase luksFormat #/dev/sdX3 --debug
# fetch uuid since this is the only reliable source
lsblk -fs
#or
blkid
# open your luks container
cryptsetup luksOpen /dev/disk/by-uuid/<uuid> <luks conainter name> 
```

# Work with it

```
#list keys
cryptsetup luksDump /dev/sdX | grep -i key

#change key
sudo cryptsetup luksChangeKey /dev/sdX

#add key
sudo cryptsetup luksAddKey /dev/sdX

#remove key
##by entering the passphrase
sudo cryptsetup luksRemoveKey /dev/sdX
##by defining the key slot
sudo cryptsetup luksKillSlot /dev/sdX 2
```
