# Change local user password

```
$Session = New-PSSession -ComputerName <host name>
Enter-PSSession $Session

$NewPassword = Read-Host -AsSecureString
Set-LocalUser -Name <user name> -Password $NewPassword

exit

Remove-PSSession $Session
```
