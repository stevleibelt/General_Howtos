# How to install DotNet 3 / DotNet3FX / DotNet 3.5

Typically, this happens if you want to enable this feature on a domain pc that is using wsus als download source.

```
#execute all as adminstrator / elevated permissions
#Win+R `cmd` + SHIFT+Enter
#disable usage of wsus
regedit.exe
#change: `HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU` from 1 to 0

#restart windows update service
net stop wuauserv
net start wuauserv

#install or enable feature
DISM /Online /Enable-Feature /FeatureName:NetFx3 /ALL

#enable usage of wsus again
regedit.exe
#change: `HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU` from 0 to 1

#restart windows update service
net stop wuauserv
net start wuauserv
```
