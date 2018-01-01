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

# configuration

```
#kernel parameters
root=<device>   #like root=/dev/mapper/dm-name
resume=<device> #like resume=/dev/mapper/dm-swap
cryptdevice=<device>:<dm-name>  #prompt for the passphrase and map device to dm-name
#more parameters are available
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
* https://www.lisenet.com/2013/luks-add-keys-backup-and-restore-volume-header/
* [system configuration for dm-crypt](https://wiki.archlinux.org/index.php/Dm-crypt/System_configuration)
* [enable TRIM for dm-crypt devices](https://wiki.archlinux.org/index.php/Dm-crypt/Specialties#Discard.2FTRIM_support_for_solid_state_drives_.28SSD.29)
* [how to use encrypted key-files](https://wiki.archlinux.org/index.php/Dm-crypt/Specialties#Using_GPG_or_OpenSSL_Encrypted_Keyfiles)
* [secure the unencrypted boot partition](https://wiki.archlinux.org/index.php/Dm-crypt/Specialties#Securing_the_unencrypted_boot_partition)
* [boot encryption with GRUB](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system#Encrypted_boot_partition_.28GRUB.29)
