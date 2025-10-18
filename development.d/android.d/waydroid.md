# Waydroid

## Steps to create a qemu machine with endeavouros and kde

```bash
# install packages
sudo pacman -S libvirt qemu-full

# create disk
qemu-img create -f qcow2 endeavouros.qcow2 20G

# install system
qemu-system-x86_64 -cdrom /path/to/Endeavouros-Galileo-11-2023.iso -boot order=d -drive file=endeavouros.qcow2,format=qcow2 -m 4G -usb -device usb-tablet -accel kvm -cpu host -smp 4

# run system
qemu-system-x86_64 -drive file=endeavouros.qcow2,format=qcow2 -m 4G -usb -device usb-tablet -accel kvm -cpu host -smp 4
```

## Steps to create a kde environment useable for waydroid

```bash
# install packages
yay -S plasma-wayland-session binder_linux-dkms waydroid
sudo echo "binder_linux" > /etc/modules-load.d/binder_linux.conf

# restart and choose wayland on login

# setup waydroid
waydroid init -s GAPPS
sudo systemctl enable waydroid-container.service
sudo systemctl start waydroid-container.service

# usage
waydroid session start
waydroid show-full-ui
```

## Links

* [QEMU: archlinux.org](https://wiki.archlinux.org/title/QEMU) - 20231125
