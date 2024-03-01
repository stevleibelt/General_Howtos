# Jailing applications in linux

## By sandboxing

### Firejail

```bash
# List running sandboxes
firejail --list

# Attach to a running sandbox
firejail --join=<int: sandbox_id>

# Firejail Firefox example
firejail --x11 --private --net=eth0 --dns=1.1.1.1 --dns=9.9.9.9 --hosts-file=~/adblock firefox --no-remote``
# But you can also use profiles
firejail --profile=firefox firefox

# Create a custom profile for a application
firejail --build=my_application.profile my_application
# If available in /etc/firejail
vimdiff my_application.profile /etc/firejail/my_application.profile
# Adapt profile and select necessary features
# ref: https://man.archlinux.org/man/firejail-profile.5
vim my_application.profile
# Launch your application
```

Desktop integration can be achived by using `firecfg`.

```bash
# Create symbolic link ot every possible application on your system
sudo firecfg

# List available symbolic links
firecfg --list

# Remove all symbolic links
sudo firecfg --clean
```

## Via filesystem level isolation

* chroot
* systemd-nspawn
* proot

## Via virtualization

* linux containers (lxc)

## Links

* [Change Root: wiki.archlinux.org](https://wiki.archlinux.org/index.php/Change_root)
* Firejail
  * [Firejail: l3net.wordpress.com](https://l3net.wordpress.com/projects/firejail
  * [Firejail: wiki.archlinux.org](https://wiki.archlinux.org/index.php/Firejail)
  * [Linux Firejail securely throw untrusted applications behind bars: flarexes.com](https://flarexes.com/linux-firejail-securely-throw-untrusted-applications-behind-bars) - 20240301
* [Linux Containers: wiki.archlinux.org](https://wiki.archlinux.org/index.php/Linux_Containers)
* [Proot: wiki.archlinux.org](https://wiki.archlinux.org/index.php/Proot)
* [Security: wiki.archlinux.org](https://wiki.archlinux.org/index.php/Security)
