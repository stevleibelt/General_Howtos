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

# backup and restore headers

```
#check your device
cryptsetup luksDump <device> > backup_file

#dump the header
cryptsetup luksHeaderBackup <device> --header-backup-file <backup file path>.img

#tryout that the backup is working
cryptsetup -v --header <backup file path>.img open <device> my_test_mapper_name
#something like this should be shown as the output
#   Key slot 0 unlocked.
#   Command successful.

#restore
cryptsetup luksHeaderRestore <device> --header-backup-file <backup file path>.img
```

# links

* https://wiki.archlinux.org/index.php/System_Encryption_with_LUKS_for_dm-crypt#LVM_on_LUKS
* https://wiki.archlinux.org/index.php/LUKS
* https://fedoraproject.org/wiki/Implementing_LUKS_Disk_Encryption#Step-by-Step_Instructions
* https://wiki.archlinux.org/index.php/System_Encryption_with_LUKS_for_dm-crypt
* https://systemausfall.org/wikis/howto/CryptoPartitionHowTo
* http://wiki.ubuntuusers.de/LUKS (german)
* https://www.cyberciti.biz/hardware/howto-linux-hard-disk-encryption-with-luks-cryptsetup-command/
* http://tomb.dyne.org/Luks_on_disk_format.pdf
* https://wiki.archlinux.org/index.php/Dm-crypt/Device_encryption
