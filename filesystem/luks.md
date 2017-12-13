# step by step howto

* fdisk <device>
    * g
    * n
    * <enter>
    * <enter>
    * <enter>
* modprobe dm_mod
* fill your partition with random data
    * shred -v <device>
* format drive / initialize your partition
    * cryptsetup --cipher aes-xts-plain64|serpent-xts-plain64 --key-size 512 --hash sha512 --iter-time 5000 --use-random --verify-passphrase luksFormat <device>
* open partition
    * cryptsetup luksOpen <device> <luks pool name>

# get informations

```
cryptsetup -v status <luks pool name>
```

# backup headers

```
cryptsetup luksDump <device> > backup_file
```

# links

* https://wiki.archlinux.org/index.php/System_Encryption_with_LUKS_for_dm-crypt#LVM_on_LUKS
* https://wiki.archlinux.org/index.php/LUKS
* https://fedoraproject.org/wiki/Implementing_LUKS_Disk_Encryption#Step-by-Step_Instructions
* https://wiki.archlinux.org/index.php/System_Encryption_with_LUKS_for_dm-crypt
* https://systemausfall.org/wikis/howto/CryptoPartitionHowTo
* http://wiki.ubuntuusers.de/LUKS (german)
* https://www.cyberciti.biz/hardware/howto-linux-hard-disk-encryption-with-luks-cryptsetup-command/
