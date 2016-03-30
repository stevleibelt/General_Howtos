# SuperSpeed USB device number 6 using xhci_hcd - external drive not recognized or listed in /dev/sd*

## get some information

Sometimes it is possible that you simple do not have enough memory.

```
#run one of the following commands
lsusb
lspci

#if available
lshal
lshw
```

It is possible to free some memory by dropping some cache.

```
echo 3 | sudo tee /proc/sys/vm/drop_caches
```

## links

* http://unix.stackexchange.com/questions/68861/external-drive-not-being-recognized
