# Setup Debian 11 on Microsoft Windows 10 by using WSL

This howto was created on the 25.05.2022. Latest update date is 25.05.2022.

You need a Windows 10 Version 2004 with build 19041 or higher.

## Enable WSL

Within this section, we want to enable the `WSL` feature of your Windows 10 operation system.

* Press `Win`+`x`-Keys
* Choose `Windows PowerShell (Admin)`
* Insert `dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart` and hit the `Enter`-Key
* Insert `$ dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart` and hit the `Enter`-Key
* Reboot your system

## Setup WSL 2

Within this section, we want to set the latest version of wsl as default.

* Press `Win`+`x`-Keys
* Choose `Windows PowerShell (Admin)`
* Insert `wsl --set-default-version 2` and hit the `Enter`-Key

## Install debian

Within this section, we want to install the debian base system.

* Press `Win`+`x`-Keys
* Choose `Windows PowerShell (Admin)`
* Insert `wsl --list --online`
* Check that something like `Debian` is listed
* Insert `wsl --install -d Debian`
* Expected is, that another shell windows is opened that guides you to a basic setup wizzard for the debain virtual machine

## Update debian

Within this section, we want to update the debian machine to the latest version.

Long story short, Microsoft offers a totally outdated version of debian. End of support for debian 9 was 06.07.2022.

* Follow [how to upgrade](https://github.com/stevleibelt/General_Howtos/blob/master/operation_system/linux/debian/upgrade.md#upgrade-paths) guide to upgrade your debian to the latest official version
* After that, you can install software on this

## Side notes

* `wsl -d Debian` will start your debian virtual machine and opens the shell inside this machine for you

## Links

* [How to Start Debian GUI in Windows 10 with WSL](https://linuxhint.com/start-debian-gui-windows-10-wsl/) - 20220524T10:12:10
