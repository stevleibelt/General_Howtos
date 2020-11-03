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

## Create user

```
# @see: https://sid-500.com/2020/11/03/powershell-import-active-directory-users-from-csv/
ForEach-Object { New-ADUser -Name $_.Name ` -GivenName $_.givenname ` -Surname $_.sn ` -Path $_."ParentOU" ` -SamAccountName $_.samAccountName ` -UserPrincipalName ($_.samAccountName + '@' + $env:userdnsdomain) ` -AccountPassword (ConvertTo-SecureString "123user!!!!!" -AsPlainText -Force) ` -EmailAddress $_."E-Mail Address" ` -Enabled $true ` -ChangePasswordAtLogon $true } ` }
```

## Rename pc

```
#@see: https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/rename-computer?view=powershell-7
#rename local pc
Rename-Computer -NewName "<newName>" -DomainCredential <domain>\<administrator> [-Restart]

#rename remote pc
Rename-Computer -ComputerName "<oldName>" -NewName "<newName>" -DomainCredential <domain>\<administrator> -Force
```
