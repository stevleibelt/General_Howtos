# How to fix stucked "Preparing to configure Windows Don't turn off your computer"

Microsoft itself is telling that this simple can happen.

## Steps to fix it

If the configuration screen os showed for more than an hour, do the following things.

* Do a hard reset (if you really have no time)
* *or*
* If you have an other computer
* Kill the "TrustedInstaller.exe" and clean up the download cached paths
    * Three ways to kill the task
        * `taskkill.exe /s the-machine /u domain\administrator /p p433w0rD! /im TrustedInstaller.exe`
        * `pskill.exe \\the-machine TrustedInstaller.exe`
        * `psexec \\the-machine taskkill /IM TrustedInstaller.exe /F`
    * The system will reboot afterwards
* Clean up the cached paths
    * Stop the services
        * `net stop bits`
        * `net stop wuauserv`
        * `net stop appidsvc`
        * `net stop cryptsv`
    * Rename SoftwareDistribution paths
        * `Ren %systemroot%\SoftwareDistribution SoftwareDistribution.yyyymmdd`
        * `Ren %systemroot%\system32\catroot2 catroot2.yyyymmdd`
    * Start the services
        * `net start bits`
        * `net start wuauserv`
        * `net start appidsvc`
        * `net start cryptsv`
* After starting the services, the two renamed paths should be recreated
* If all is working well, delete the renamed paths

# Links

* [Fix: Windows Stuck at "Preparing to Configure Windows"](http://woshub.com/fix-server-stuck-on-preparing-to-configure-windows/) - 20210824
