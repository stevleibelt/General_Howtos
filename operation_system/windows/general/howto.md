# forcing a time synchronisation

```
#WIN+R (as administrator)
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

# restart tcp/ip stack

```
#WIN+R (as administrator)
#empty dns cache
ipconfig /flushdns
#refresh netbios name
nbstat -RR
#reset ip and winsock catalog
netsh int ip reset
netsh winsock reset
#restart pc
```

# WinSxS

Is the kind of component/feature path that is used for all updates, hotfixes or service packs.

## Cleanup by using dism.exe

```
#WIN+R + "cmd" + CTRL+SHIFT+ENTER
#check what can be done, only available on windows 8.1 and above
dism.exe /online /cleanup-image /analyzecompontentstore

#cleanup path by loosing the chance to uninstall an update
#   remove not needed files
dism.exe /online /cleanup-image /spsuperseded
#   remove all files from updates
dism.exe /online /cleanup-image /startcomponentcleanup
#recheck disc space
dism.exe /online /cleanup-image /analyzecompontentstore
```
