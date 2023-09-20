# Log system log

```
#best is to use minigw64 or something similar
tail -f /c/Windows/Logs/*/*.log
#for powershell
#   tailing last 10 lines in all files with the 
#       suffix `.log` in the past and keep on tailing
Get-Content C:\Windows\Logs\*\*.log -tail 10 -wait
```
