# WinSxS

Is the kind of component/feature path that is used for all updates, hotdixes or service packs.

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
