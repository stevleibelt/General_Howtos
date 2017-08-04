# sysctl

Sysctl is the central tool to change kernel values.
Each kernel value can also be read or written via the "/proc/sys" path, just replace the "." in the sysctl value names with a "/" for the fitting directory.

You can persist changes by putting it into the file "/etc/sysctl.d/99-my-conf.conf".

## example

```
#list all available commands
sysctl -a
#list all matching your "search term"
#sysctl <search term>
sysctl vm
```

# links

* http://linux.die.net/man/8/sysctl
* https://en.wikipedia.org/wiki/Sysctl
* https://www.linux.com/news/kernel-tuning-sysctl
* https://wiki.archlinux.org/index.php/Sysctl
