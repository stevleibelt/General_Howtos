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

## Tools to change when using i3wm

* `arandr` will become `wdisplays`
* `autorand` will become `kenshi`
* `dmenu` will become `wmenu`
* `i3bar` will become `waybar`
* `i3wm` will become `sway`
* `slock` will become `swaylock`
* `synergy` become `waynergy`
* `xbacklight` will become `light` or `brightnessctl`
* `xrander` will become `wlr-randr`

## Links

* [i3 application migration to sway](https://github.com/swaywm/sway/wiki/i3-Migration-Guide#common-x11-apps-used-on-i3-with-wayland-alternatives) - 20230105
* [Progress status page of wayland](https://arewewaylandyet.com/) - 20230105
* [Possible way to be able to share your screen when running wayland](https://soyuka.me/make-screen-sharing-wayland-sway-work/) - 20230105
* [Wayland vs Xorg](https://www.secjuice.com/wayland-vs-xorg/) - 20180716

