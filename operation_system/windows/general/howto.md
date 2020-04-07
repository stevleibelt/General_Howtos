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

# Get windows key

```
wmic path SoftwareLicensingService get OA3xOriginalProductKey
```

# windows activation not working 0x800704CF

```
#WIN+R (as administrator)
#check if there is a (legacy but again introduced system proxy configured)
netsh winhttp show proxy
#if there is one configured
netsh winhttp reset proxy
#after that, try again activate your key
```

# Fix 0x8024401c

```
#WIN+R (as administrator)
`regedit` and press OK
Go to `HKEY_LOCAL_MACHINE` > `Software` > `Policies` > `Microsoft` > `Windows` > `WindowsUpdate` -> `AU`
Change value of `UseWUServer` from whatever to `0`
```

[source](https://www.drivereasy.com/knowledge/windows-update-error-0x8024401c-fixed/) - 2020-03-04

# Fix "Windows updates stuck at x %"

```
#WIN+R (as administrator)
cmd
net stop wuauserv
#Open explorer at "C:\Windows\SoftwareDistribution"
#Delete all the content inside this path
net start wuauserv
```

# Log in to a locked user session

* given is
    * the user is logged in
    * the user has locked its session
* steps
* login as administrator
* download [PsExec.exe](https://docs.microsoft.com/en-us/sysinternals/downloads/psexec) or the full [sysinternals-suite](https://live.sysinternals.com/)
* open a powershell as administrator
* check that no taskmgr.exe is running
* enter `PSEXEC -SID taskmgr.exe`
* go to `Users`, right click on the user session you want to connect and select `Connect`

[source](https://www.windowspro.de/sami-laiho/gesperrten-windows-desktop-eines-users-zugreifen-ohne-passwort-zu-kennen) - 2020-03-19
