#if currently booted by a live cd
mount root (and if available boot) partition under /mnt (/mnt/boot)
grub-install --root-directory=/mnt /dev/sda
#else
grub-install /dev/sda
-entries
/etc/grub.d/
-build menu
grub-mkconfig
-settings
/etc/default/grub
