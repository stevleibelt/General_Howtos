# sysrq

With `/proc/sysrq`, you are able to send commands directly into the kernel.

## Usage

```bash 
# Force to sync all mounted filesystems
echo s > /proc/sysrq
# Force to remount all mounted filesystems in read-only
echo u > /proc/sysrq
# Reboot system without syncing or unmounting any filesysmtes
echo b > /proc/sysrq
```

## Links

* [Admin Guide: kernel.org](https://www.kernel.org/doc/html/latest/admin-guide/sysrq.html) - 20261007
