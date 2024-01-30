# sysctl

Sysctl is the central tool to change kernel values.
Each kernel value can also be read or written via the "/proc/sys" path, just replace the "." in the sysctl value names with a "/" for the fitting directory.

You can persist changes by putting it into the file "/etc/sysctl.d/99-my-conf.conf".

Settings from `/usr/lib/sysctl.d/*.conf` will be overwritten by settings from `/etc/sysctl.d/*.conf`.
You can load `*.conf` files manually with `sysctl --load=filename.conf`.


## How to use

```bash
#list all available commands
sysctl -a
#list all matching your "search term"
#sysctl <search term>
sysctl vm
```

## Controll Swappiness

```bash
#list current value
cat /proc/sys/vm/swappiness

#set temporary
sudo sysctl vm.swappiness=<int: 0-100>

#set permanent
sudo echo "vm.swappiness=<int: 0-100>" | sudo tee -a /etc/sysctl.d/99-swappiness.conf
```

## Controll memory overcommit

```bash
# ref:  https://unix.stackexchange.com/a/732810
#       https://www.kernel.org/doc/Documentation/vm/overcommit-accounting
#
# 0: kernel guesses how much to overcommit memory
# 1: always overcommit (this is bat country)
# 2: kernel will enforce using the limit set in
#   overcommit_ratio (percentage) or 
#   overcommit_kbytes (absolute value)
sysctl vm.overcommit_memory=2
sysctl vm.overcommit_ration=20  #can be 50 for desktop machines

# fetch current overcommit limit
cat /proc/meminfo | grep -i commit
```

## Links

* [kernel tuning with sysctl: linux.com](https://www.linux.com/news/kernel-tuning-sysctl) - 20160905
* [Overcommit memory in Linux: linuxembedded.fr](https://www.linuxembedded.fr/2020/01/overcommit-memory-in-linux) - 20240130
* [sysctl: wiki.archlinux.org](https://wiki.archlinux.org/index.php/Sysctl) - 20160905
* [sysctl explorer: sysctl-explorer.net](https://sysctl-explorer.net/) - 20240130
* [sysctl - linux man page: linux.die.net](http://linux.die.net/man/8/sysctl) - 20160905
