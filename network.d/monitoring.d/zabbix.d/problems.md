# Problems and why they could happen

## General, check the logs

```pwsh
#on Windows PowerShell
Get-Content "c:\Program Files\Zabbix Agent\zabbix_agentd.log" -tail 10 -wait
```

## Interface In half-duplex mode

If this is flipping it is a good indicator that the cable or the contacts are going to die.
There is another option, it could be that this is triggered by the standby and the implemented [wake-on-lan](https://en.wikipedia.org/wiki/Wake-on-LAN) solution.

## Active check is not working, no data from client

### Check if the client can reach the zabbix server

Check if `ServerActive` is pointing to the right machine.

```pwsh
#Windows PowerShell
Test-NetConnection -ComputerName <string: hostname_or_ip_address> -Port 10050
```
