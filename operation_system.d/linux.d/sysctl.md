# sysctl - configure kernel parameters at runtime

Use a tool like `lynis` to check if live system and `/etc/sysctl.conf` are aligned or not.

## sidplay all values

```
sysctl -a
```

## get current highest process id available on the system

```
sysctl kernel.pid_max
#or
cat /proc/sys/kernel/pid_max
```
