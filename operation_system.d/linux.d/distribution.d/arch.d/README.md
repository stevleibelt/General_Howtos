# Arch Linux Distribution

# Howto Section

## Downgrade package

```bash
# ref: https://archive.archlinux.org/packages/
# Example is to downgrade to an existing flamshot version

mkdir temporary
cd temporary
wget https://archive.archlinux.org/packages/f/flameshot/flameshot-12.1.0-6-x86_64.pkg.tar.zst
wget https://archive.archlinux.org/packages/f/flameshot/flameshot-12.1.0-6-x86_64.pkg.tar.zst.sig
sudo pacman -U flameshot-12.1.0-6-x86_64.pkg.tar.zst
```

## List Available Fonts

```bash
# You can do the same with "font" instead of "ttf"
pacman -Ss ttf | grep 'community\|extra'
```

## Links

* [general recommendations](https://wiki.archlinux.org/index.php/General_recommendations)
* [firewall](https://wiki.archlinux.org/index.php/Firewalls)
* [wiki](https://wiki.archlinux.org/)
* [ssd](https://wiki.archlinux.org/index.php/Solid_State_Drives)
