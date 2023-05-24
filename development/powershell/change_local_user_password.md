# Change local user password

```pwsh
$Session = New-PSSession -ComputerName <host name>
Enter-PSSession $Session

$NewPassword = Read-Host -AsSecureString

#bo: first way
Set-LocalUser -Name <user name> -Password $NewPassword

exit
#eo: first way

#bo: second way
Invoke-Command -Session $Session -ScriptBlock {Set-LocalUser -Name <user name> -Password $NewPassword}
#eo: second way

Remove-PSSession $Session
```

