# Windows 7

## How To's

### Start in "save mode"

* hit "f8" as often as you want while windows is booting up

### Reset password

ref: https://www.datenschutz.org/windows-7-passwort-vergessen - 20260627

* Download [Windows 7](https://winfuture.de/downloadvorschalt,2671.html) or [Windows 7 Professional](https://winfuture.de/downloadvorschalt,3291.html)
* Boot up dvd
* Select `Jetzt installieren`
* Select `Computerreparaturoptionen`
* Select `Problembehandlung`
* Click on `Eingabeaufforderung`
```bash
# Repeat the following with c, d, e etc. until you found the
#   directory `Windows`
c: dir

cd c:\Windows\System32
ren Utilman.exe Utilman.exe.dist
copy cmd.exe Utilman.exe
```
* Click on `Herunterfahren`
* Start your installed windows
* Select `Erleichterte Bedienung`
* Set password for user: `net user <string: account_name> <string: password>`

## Links

* Cleanup Tools:
  * [Performance maintainer](http://www.pcstarters.net/performance-maintainer)
* [english 64 bit iso download page](http://windows.microsoft.com/en-us/windows/answers?tId=f39bb8c1-28d4-4c04-a1c5-51b3fd466e30)
    * [home premium](http://msft.digitalrivercontent.net/win/X17-58997.iso)
    * [professional](http://msft.digitalrivercontent.net/win/X17-59186.iso)
    * [ultimate](http://msft.digitalrivercontent.net/win/X17-59465.iso)
* Fetch Passwords:
  * [internet explorer](http://www.nirsoft.net/utils/internet_explorer_password.html)
  * [outlook](https://www.nirsoft.net/web_browser_tools.html)
* [German 64 bit iso download page](http://answers.microsoft.com/de-de/windows/forum/windows_7-windows_install/wo-kann-ich-die-windows-7-iso-dateien/610a3a3c-e99c-42e6-8cf8-fda31127b035?auth=1)
    * [professional with sp1](http://msft.digitalrivercontent.net/win/X17-24289.iso)
* [64 bit professional download page (different languages)[http://microsoftstore.me/microsoft/windows-7-professional-x86x64-iso-download/)
    * [german](http://msft.digitalrivercontent.net/win/X17-24289.iso)
