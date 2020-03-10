# Example commands for active directory

```
#count all active user
(Get-ADUser -Filter * -SearchBase "ou=myou,dc=bazzline,dc=local" | WHERE {$_.enabled -eq $true}).count

#count all active pcs
(Get-ADComputer -Filter * -SearchBase "ou=myou,dc=bazzline,dc=local" | WHERE {$_.enabled -eq $true}).count

#get members of an ad group
(Get-ADGroupMember -Identit "My-Group").count
```
