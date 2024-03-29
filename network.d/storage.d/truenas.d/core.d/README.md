# TrueNas

Currently, all the content in here is for the `TrueNAS core` system, based on `FreeBSD`.

# Setup

## LDAP

LDAP Support for using it in smb is deprecated. You should use ad domains.

```
#@see: https://www.truenas.com/docs/core/directoryservices/ldap/
Hostname: <hostname of the primary dc>
Base DN: dc=mydomain,dc=local
Bind DN: administrator@mydoman.local
Bind Password: Il0v30pen50urc3!
```

# Error soliving

## truenas rsync: failed to set permissions on

### Description

After configuring an rsync backup like [this](../synology/README.md), you get an error `truenas rsync: failed to set permissions on`.
You can find the error in `/var/log/messages.log`. On your client device, there is an unclear message like "not enough rights".

### Error solving

* Remove the `ACL` from the storage you have configured in your rsync module
    * `Storage` -> `Pools`
    * Click on the three dots and select `Edit Permissions`
    * Scroll to the bottom of the page
    * Click on `STRIP ACLS`
    * Set the Permissions for the rsync user and group again
* Reset the rights to the user you have configured in your rsync module

### Note

* Just another reset of the rights is not working

## NT_STATUS_ACCESS_DENIED

### Description

After upgrade from 12u6 to 12u7, I was not able to access my smb shares.

All I get is an `NT_STATUS_ACCESS_DENIED`.

### Error solving

First, I took a look into `/usr/local/samba`.

I than called the `nsupdate` with debug logging: `/usr/local/bin/samba-nsupdate -g -L 6`.

After that, I tried to tail the log files: `tail -f /var/log/samba4/auth_audti.log /var/log/samba4/log.wb-SVFG`.

Furthermore, I tried to get an idea what is going on by calling the following commands.

```
#get overview of current activedirectory service status
midclt call activedirectory.domain_info | jq

#check how domain is doing
wbinfo -t

#list users
wbinfo -u

#list groups
wbinfo -g
```
