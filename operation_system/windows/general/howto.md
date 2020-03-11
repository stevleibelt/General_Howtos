# forcing a time synchronisation

```
wi32tm /resync
```

# check system integretiy

```
#WIN+R (as administrator)
SFC /Scannow
```

# set windows key per command line

```
#hint:
#   you have to be local administrator
#   you should be in the wan and not behind a proxy
slmgr.vbs /ipk xxxx-xxxx-xxxx-xxxx-xxxx
```
