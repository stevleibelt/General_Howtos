# Sessions (ssh) via PowerShell

PSSession is a kind of ssh+screen.

# General Commands

```
#list everything about ps sessions
Get-Help *-PSSession

#Create new persistent session
#You can put them all in a varabile by doing "$myListOfPSSession = New-PSSession ..."
New-PSSession -ComputerName <hostname>[, <hostname>[, ...]] [-Credetial mydomain\administrator]
#Create multiple sessions by using a text file with computer names
$listOfSessions = Get-Content c:\my_servers.txt | New-PSSession -ThrottleLimit 20
#Create a ssh session
New-PSSession -HostName user@hostname -KeyFilePath c:\\private_key

#list established ps sessions
Get-PSSession [-ComputerName <hostname>]

#exit a session
Exit-PSSession
#_or
exit

#Disconnect from within a session
#current process is still running until it is blocked or output buffer is full
Disconnect-PSSession
```

# Usages Commands

```
#Run a script on multiple servers by using named sessions
#   Create sessions
$listOfSessions = New-PSSession -ComputerName ServerOne, ServerTwo -Name ITTaskUpdate
#   Run script
Invoke-Command $listOfSessions -FilePath \\NetworkShare\IT\Scripts\Update.ps1
#Disconnect from the session to give someone else the option to open this session
Get-PSSession -Name ITTaskUpdate | Disconnect-PSSession
#Check session status
Get-PSSession -Name ITTaskUpdate
#Now someone else could hook into the session
$session = Connect-PSSession -ComputerName ServerOne -Name ITTaskUpdate [-Credential mydomain\administrator]
Invoke-Command -Session $session {<some command executed on the server>}
#And Disconnect again so the other person can finish its task
Disconnect-PSSession -Session $session
```

# Links

* [About PSSessions](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_pssessions?view=powershell-7)
