# Example commands for active directory

## Count user, pcs and groups etc in ad

```
#count all active user
(Get-ADUser -Filter * -SearchBase "ou=myou,dc=bazzline,dc=local" | WHERE {$_.enabled -eq $true}).count

#count all active pcs
(Get-ADComputer -Filter * -SearchBase "ou=myou,dc=bazzline,dc=local" | WHERE {$_.enabled -eq $true}).count

#get members of an ad group
(Get-ADGroupMember -Identit "My-Group").count
```

## Rename pc

```
#@see: https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/rename-computer?view=powershell-7
#rename local pc
Rename-Computer -NewName "<newName>" -DomainCredential <domain>\<administrator> [-Restart]

#rename remote pc
Rename-Computer -ComputerName "<oldName>" -NewName "<newName>" -DomainCredential <domain>\<administrator> -Force
```
