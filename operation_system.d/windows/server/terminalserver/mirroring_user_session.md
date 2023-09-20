# Mirror or shadow user session

This is like using VNC but with RDP.

```
#mirror an existing user session
#the users gets a promt so warn your user in advance
mstsc.exe /v:<terminal server host name> /shadow:<session id> /control
```

# Links

* [How to Shadow (Remote Control) a User RDP session on RDS Windows Server 2016 / 2012 R2](http://woshub.com/rds-shadow-how-to-connect-to-a-user-session-in-windows-server-2012-r2/) - 2019-06-14
* [Remote Desktop Session Shadowing Mode in Windows 10](http://woshub.com/rdp-session-shadow-to-windows-10-user/) - 2019-05-18
