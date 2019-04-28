# Installation

## On Archlinuxarm

```
mkdir -p software/source/org/archlinux/aur
cd software/source/org/archlinux/aur
git clone https://aur.archlinux.org/pi-hole-ftl.git
cd pi-hole-server
makepkg -sri
sudo pacman -U *.tar.xz
cd ../
git clone https://aur.archlinux.org/pi-hole-server.git
cd pi-hole-server
makepkg -sri
sudo pacman -U *.tar.xz
```

# Link

* [Pi-hole - arch linux wiki](https://wiki.archlinux.org/index.php/Pi-hole)
