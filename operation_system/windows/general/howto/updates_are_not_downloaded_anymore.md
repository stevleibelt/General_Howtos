# Updates are not downloaded anymore

I can happen that windows suddenly stops to download updates.
The percentage stops at 0% or somewhere else.

## Steps

* Either use [this Reset-WindowsUpdate.ps1 script.](https://gist.github.com/chw2054/9a5ff06d61c32c1e8cdc364b08df4156)
* Or follow this steps by opening the powershell as administrator

```
Stop-Service -Name BITS
Stop-Service -Name wuauserv
Stop-Service -Name appidsvc
Stop-Service -Name cryptsvc

Remove-Item "$env:allusersprofile\Application Data\Microsoft\Network\Downloader\qmgr*.dat" -ErrorAction SilentlyContinue

Remove-Item $env:systemroot\SoftwareDistribution -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item $env:systemroot\System32\Catroot2 -Recurse -Force -ErrorAction SilentlyContinue

Remove-Item $env:systemroot\WindowsUpdate.log -ErrorAction SilentlyContinue

Start-Service -Name BITS
Start-Service -Name wuauserv
Start-Service -Name appidsvc
Start-Service -Name cryptsvc
```
