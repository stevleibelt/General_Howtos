# Issue

`The trust relationship between this workstation and the primary domain failed.`

`Die Vertrauensstellung zwischen dieser Arbeitsstation und der primären Domäne konnte nicht hergestellt werden`.

# Solution

Well, there is no silver bullet/the cake is a lie.

* reset computer password via powershell
    * login as local admin
    * start powershell as administrator
    * `Reset-ComputerMachinePassword` -Server <domain controller> -Credential <domain>\<administrator>
    * restart computer
    * login as <domain>\<user>
    * if this does not work, you can do the same in the command environment
    * `NETDOM RESETPWD /Server:<domain controller> /UserD:<domain>\<administrator> /PasswordD:*`
* try to fix things internally
    * login as local admin
    * start powershell as administrator
    * `Test-ComputerSecureChannel -Verbose`
    * if it retunrs `$false`
    * `Test-ComputerSecureChannel -Repair -Server <domain controller> -Credential <domain>\<administrator>`
    * if this does not work, you can do the same in the command environment
    * `NETDOM RESETPWD /Server:<domain controller> /UserD:<domain>\<administrator> /PasswordD:*`    #if you write `*` in the password, a prompt will be displayed to enter your password
* if all is not working
    * login as local admin
    * remove pc from domain by switching into workgroup
    * restart
    * add pc back into domain

# Links

* [Lösung für "Die Vertrauensstellung zwischen dieser Arbeitsstation und der primären Domäne konnte nicht hergestellt werden"](https://www.windowspro.de/wolfgang-sommergut/loesung-fuer-vertrauensstellung-zwischen-dieser-arbeitsstation-primaeren-domaene) - 20171206
* [Lösung - Die Vertrauensstellung zwischen dieser Arbeitsstation und der primären Domäne konnte nicht hergestellt werden](https://itrig.de/index.php?/archives/1840-Loesung-Die-Vertrauensstellung-zwischen-dieser-Arbeitsstation-und-der-primaeren-Domaene-konnte-nicht-hergestellt-werden.html) - 20140326
* [Repairing Broken Trust Relationship Between Workstation and AD Domain](http://woshub.com/repair-trust-relationship-workstation-with-ad-domain/) - 20210309
* [Reset-ComputerMachinePassword](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/reset-computermachinepassword) - 20201104
* [Test-ComputerSecureChannel](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/test-computersecurechannel) - 20201104
* [Use Netdom.exe to reset machine account passwords of a Windows Server domain controller](https://docs.microsoft.com/en-us/troubleshoot/windows-server/windows-security/use-netdom-reset-domain-controller-password) - 20200908
