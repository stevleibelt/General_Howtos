# preparation before usage

Check if your kernel and cpu supports xen virtualization.

```
#no output indicates no support
grep -E "(vmx|svm)" --color=always /proc/cpuinfo
```

* hvm is slower than pv
* pv needs manipulation of domU

# distributions with xen

Based on the [offical list](https://wiki.xenproject.org/wiki/Xen_Project_Software_Overview)

* Arch Linux
* Alpine Linux
* CentOS (5 and above 6.3)
* Debian GNU/Linux
* Fedora (above 16)
* Finnix
* FreeBSD
* Gentoo Linux
* Magia
* netBSD
* openSUSE
* Ubuntu

# link

* [getting started on xenproject.org](https://www.xenproject.org/users/getting-started.html)
* [xen on wiki.archlinux.org](https://wiki.archlinux.org/index.php/Xen)
* [xen on en.wikipedia.org](https://en.wikipedia.org/wiki/Xen)
* [ipfire for xen](http://wiki.ipfire.org/en/virtualization/xen/start)
    * [hvm installation](http://wiki.ipfire.org/en/virtualization/xen/ipfire_as_hvm_with_xen_4.0.1)
* [xen on debian](https://wiki.debian.org/Xen)
* [xen on gentoo](https://wiki.gentoo.org/wiki/Xen)
* [xen on wiki.archlinux.de](https://wiki.archlinux.de/title/Xen)
