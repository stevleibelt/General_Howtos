# howto

## vorbetrachtung

* swap this is greater than or equal to your memory
* you are using grub version > 2.0.0

### adapt /etc/default/grub

* add "resume=/dev/disk/by-uuid/<uuid of your swap>" to "GRUB_CMDLIINE_LINUX"
* "grub-mkconfig -o /boot/grub/grub.cfg"

## adapt /etc/mkinitcpio.conf

* add "resume" in "HOOKS" section
* if you are using lvm on luks, "resume" must be after the "encrypt" and "lvm" hook
* "mkinitcpio -p linux"

## tryout

* systemctl hibernate

# links

* https://wiki.archlinux.org/index.php/Power_management#Power_management_with_systemd
* https://wiki.archlinux.org/index.php/Suspend_and_hibernate#systemd
