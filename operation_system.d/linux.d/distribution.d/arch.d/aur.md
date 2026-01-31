# AUR - Arch User Repository

## Installing Packages from AUR

### By using PKGBUILD

```bash
git clone https://aur.archlinux.org/<your package>
cd <your package>
makepkg -sri
#for archlinuxarm
makepkg -Acs    #A stands for ignore architecture
pacman -U *.tar.xz
```

### By building from Source (if shipped with PKGBUILD)

```bash
wget <source path of your package>
tar -xzf <source file>
makepkg -sri
pacman -U *.tar.xz
```

## Handling Errors

### FAILED (unknown public key <key>)

```bash
gpg --receive-keys <key>
#or
pgp --recv-keys <key>
```

## Links

* [How to review an AUR package: bertptrs.nl](https://bertptrs.nl/2026/01/30/how-to-review-an-aur-package.html) - 20260131
* https://wiki.archlinux.org/index.php/AUR_helpers
* http://archlinux.fr/man/yaourt.8.html
* https://github.com/Jguer/yay
* https://github.com/polygamma/aurman
* https://github.com/trizen/trizen
* https://xyne.archlinux.ca/projects/bauerbill/
