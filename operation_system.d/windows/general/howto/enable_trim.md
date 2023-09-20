# Trim

```
#Check
#   0 -> trim is enabled
#   1 -> trim is disabled
fsutil behavior query DisableDeleteNotify

#Enable it
fsutil behavior set DisableDeleteNotify 0

#Disable it
fsutil behavior set DisableDeleteNotify 1
```
