# list of power states

* freeze - suspend to idle
* standby - power on suspend
* mem - suspend to ram
* disk - suspend to disk

# suspend to ram or disk

## fetch supported power states

```
cat /sys/power/state
```

# links

* [suspend to disk/ram with linux.](http://karellen.blogspot.de/2013/07/suspend-to-diskram-with-linux.html)
* [power management interface for system sleep](https://www.mjmwired.net/kernel/Documentation/power/interface.txt)
