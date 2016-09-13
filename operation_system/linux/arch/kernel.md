# switching from latest kernel to lts

```
#general steps, if you are using additional software like archzfs, you have to do it in an archiso live environment with arch-chroot
pacman -Syu
#headers are optional, you know if you need them
pacman -S linux-lts linux-lts-headers
#check if new ramdisk exists
ls -halt /boot | grep lts
#remove latest kernel
pacman -R linux linux-headers
#update grube to boot from the right ramdisk
grub-mkconfig -o /boot/grub/grub.cfg
#reboot
```

If you have installed other software, it can happen that you have to remove and reinstall them when switching between kernels.
This is important if you use software using dkms or other kernel dependend things (like for the headers, you will know if you need to do this).

# links

* http://unix.stackexchange.com/questions/284617/how-to-switch-arch-linux-to-lts-kernel
* https://wiki.archlinux.org/index.php/Kernels
* https://wiki.archlinux.org/index.php/GRUB#Configuration
* http://www.gnu.org/software/grub/manual/html_node/index.html
