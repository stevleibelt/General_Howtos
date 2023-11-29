# takeown

## Examples

```
#changes ownership to current user
takeown /f <file name or path>
```

## Parameters

```
/a              changes ownership to administrator group
/r              changes ownership recursive
/s <host>       runs command on this host
/u <username>   runs command with permission of this user
/p <password>   specifies password of user provided by /u
/d [Y|N]        suppress confirmation prompt if user does not have the "list folder" permission, Y = take ownership, N = skip directory
```

# links

* [takeown - microsoft.com](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/takeown) - 2020-06-16
