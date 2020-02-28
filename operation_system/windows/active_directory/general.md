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

| Abkürzung | Bezeichnung |
| --- | --- |
| CN | Common Name |
| DC | Domain Component (can be multiple) |
| GP | Group Policy |
| GPO | Group Policy Object |
| OU | Organizational Unit |
| RSoP | Result Set of Policy |
| SAM | Security Account Manager |
| SID | Security IDentifyer |

## Example

Give is a printer with the name "cobraLazer" in the unit "IT" for the domain "compu.global.hyper.meganet.
The fully qualified name is "CN=cobraLazer,OU=IT,DC=compu,DC=global,DC=hyper,DC=meganet".

# Group Policy

* centralized managemend and configuration of operation systems, applications and user settings in an active directory
* a set of group policies is alled a group policy object
* without an active directory, a local group policy (LGPO/LocalGPO) can be used stand alone
* refresh of the policies
    * in a domain, every five minutes
    * not in a domain, every 90 minutes with a random 30 minutes offset
* which settings are applied when
    * on bootup/user log in: automated software installation, drive mappings, startup scripts, logon scripts
    * else: all other things
* group policies are processed (applied) in the following order (if there are multiple policies per step, they are processed in the order set by the administrator):
    * local - policies stored on this machine
    * site - grouped computers by their location (physical proximity)
    * domain - sites in a domain
    * organizational unit - grouped computers as a logical unit (administrator, writers, etc.)
* policy settings are inherited
* applying a policy can be controlled by using the [Windows Management Instrumention](https://en.wikipedia.org/wiki/Windows_Management_Instrumentation) for filtering (only apply this policy for pcs with that amount of memory or cpu ...)
* with windows 8, following enhacements where released
    * [gpupdate](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/gpupdate) - typically called as `gpupdate /force` - forces a group policy update every 10 minutes with an random offset
    * [gpresult](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/gpresult) - typically called as `gpresult /R`, displays result set of policy (RSoP) for [remote] user and computer
    * group policy infrastructure status - reports if a GPO is not replicated correctly over all DC's
    * group policy results report - now times the execution of individual compontens when doing an group policy update

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

## Set user property

```
#works mostly
Set-ADUser -Identity johndoe -EmailAddress "john_doe@company.com"

#for some special properties like pager, you have to use replace
Set-ADUser -Identity johndoe -Replace @{pager = 123-456 789}
```


# Links

* [Active Directory - wikipedia.org](https://en.wikipedia.org/wiki/Active_Directory) - 2020-01-27
* [Administrative Template - wikipedia.org](https://en.wikipedia.org/wiki/Administrative_Template) - 2020-01-27
* [AGDLP - wikipedia.org](https://en.wikipedia.org/wiki/AGDLP) - 2020-01-27
* [Group Policy - wikipedia.org](https://en.wikipedia.org/wiki/Group_Policy) - 2020-01-28
