# sysctl - configure kernel parameters at runtime

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
