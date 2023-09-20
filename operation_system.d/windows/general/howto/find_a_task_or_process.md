# Find a task or process

```
#get a very verbose output for each running process

Get-Process | Format-List *

#filter a process by path
Get-Process | Where-Object { $_.Path -eq "C:\program files\foo\bar.exe" } | Format-List *
```
