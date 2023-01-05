# Wayland display server

## Example how to migrate from i3wm to sway on arch linux

```bash
#the lines below are pretty much untested

#install packages
sudo pacman -S sway xorg-xwayland wayland

mkdir ~/.config/sway
cp /etc/sway/config ~/.config/sway

vim ~/.config/sway
#set $term

#start sway
sway
```


