# signatur from ... is unknown trust

```
sudo mv /etc/pacman.d/gnupg /etc/pacman.d/gnupg.<currentdate>

sudo pacman-key --init
sudo pacman-key --populate archlinux
sudo pacman -S archlinux-keyring
sudo pacman -Syyu
```
