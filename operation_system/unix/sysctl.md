# sysctl

Sysctl is the central tool to change kernel values.
Each kernel value can also be read or written via the "/proc/sys" path, just replace the "." in the sysctl value names with a "/" for the fitting directory.

You can persist changes by putting it into the file "/etc/sysctl.d/99-my-conf.conf".

# Example

## General

```
#list all available commands
sysctl -a
#list all matching your "search term"
#sysctl <search term>
sysctl vm
```

## Swappiness

```
#list current value
cat /proc/sys/vm/swappiness

#set temporary
sudo sysctl vm.swappiness=<int: 0-100>

#set permanent
sudo echo "vm.swappiness=<int: 0-100>" | sudo tee -a /etc/sysctl.d/99-swappiness.conf
```

# links

* http://linux.die.net/man/8/sysctl
* https://en.wikipedia.org/wiki/Sysctl
* https://www.linux.com/news/kernel-tuning-sysctl
* https://wiki.archlinux.org/index.php/Sysctl
