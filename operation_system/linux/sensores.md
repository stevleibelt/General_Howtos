# How to

```
#list available temperature zones
#@see https://askubuntu.com/a/938751
#x86_pkg_temp should be your cpu
ls -1 /sys/class/thermal/thermal_zone*/type | xargs -I % sh -c "echo % ; cat %"
```
