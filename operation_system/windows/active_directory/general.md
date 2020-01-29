# General

* Active directory is an umbrella containting multiple services
* AGDLP is an abbreviation for "account, global, domain local, permission"
* AD is role bassed access controll (RBAC) system (user rights are defined by an amount of group rights and not individual rights)
* A active directory domain service (AD DS) is called a domain controller (DC)

# Services

| Name | Description |
| --- | --- |
| Domain Services (AD DS) | Served by the Domain Controller and takes care of the rights and credentials of a user |
| Certificate Services (AD CS) | Serves a public key infrastructure |
| Federation Services (AD FS) | Single sign-on service |
| Rights Management Services (AD RMS) | Service to limit access to an object based on rights |

# Logical Structure

| Name | Description |
| --- | --- |
| Objects | Resource (e.g. printer) or security principals (users and groups) |
| AD Database | Collection of objects |
| Domain | Logical group of network objects sharing the same AD database |
| Tree | Collection of domains (e.g. it.foo.bar) |
| Forest | Collection of trees (full structure, e.g. foo.bar) |
| Organizational units (OU) | Group of domain objects (no additional namespace!) |

# Naming

* CN = Common Name
* OU = Organizational Unit
* DC = Domain Component (can be multiple)
* SAM = Security Account Manager
* SID = Security IDentifyer

## Example

Give is a printer with the name "cobraLazer" in the unit "IT" for the domain "compu.global.hyper.meganet.
The fully qualified name is "CN=cobraLazer,OU=IT,DC=compu,DC=global,DC=hyper,DC=meganet".

# PowerShell

## Get all properties for a user

```
#if you know the samUserName
Get-ADUser -Identity <samUserName> -Properties *

#if you have to search for name
Get-ADUser -Filter "Name -like 'bo*'" -Properties *
```

## Get all users in the group admin

```
Get-ADGroupMember -Identity admin | SELECT SamAccountName, Name, ObjectClass
```

## Get current active domain controller

```
#by using pure powershell
([ADSI]”LDAP://RootDSE”).dnshostname
#by using the ActiveDirectory powershell module
Get-ADDomainController -Discover
```


# Links

* [Active Directory - wikipedia.org](https://en.wikipedia.org/wiki/Active_Directory) - 2020-01-27
* [Administrative Template - wikipedia.org](https://en.wikipedia.org/wiki/Administrative_Template) - 2020-01-27
* [AGDLP - wikipedia.org](https://en.wikipedia.org/wiki/AGDLP) - 2020-01-27
* [Group Policy - wikipedia.org](https://en.wikipedia.org/wiki/Group_Policy) - 2020-01-28
