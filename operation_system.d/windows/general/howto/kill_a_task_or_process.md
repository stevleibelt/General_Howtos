# How to kill a task or service

```
#kill a service like wuauserv
taskkill /F /FI "SERVICE eq wuauserv"

#kill all services that are not responding
taskkill /F /FI "sstatus eq not responding"

#kill a service on a remote server
taskkill /S my-server /F /FI "SERVICE eq wuauserv"
```

# Link

* [Kill a Windows Service That Stucks on Stopping or Starting](http://woshub.com/killing-windows-services-that-hang-on-stopping/) - 20210805
