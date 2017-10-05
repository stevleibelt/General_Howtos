# GPT or GUID partition table

## With sgdisk

```
#delete all available parittions
sgdisk --zap-all /dev/<device>

#list all avialalbe GUID types
sgdisk -L

#create new parition with 
#   aligned 4k sectors (-a 4096)
#   not using 10000 at the end to enable the chance add another device with "almost the same number of sectors" to the pool
#   the lable "<your lable>"
#   the type "Solaris root"
sgdisk -a 4096 -n 1:4096:-10000 -c 1:"<you lable>" -t 1:bf00 /dev/<device>
```

# link

* http://www.rodsbooks.com/gdisk/sgdisk-walkthrough.html
