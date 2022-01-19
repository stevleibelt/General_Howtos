# Sessions (ssh) via PowerShell

PSSession is a kind of ssh+screen.

`Enter-PSSession` is a PowerShell cmdlet for working on remote computers.

`PSRemoting` is based on Web Service for Management (WS-Management) and `WinRM service` (Windows Remote Management).

# General Commands

```
#list everything about ps sessions
Get-Help *-PSSession

#Create new persistent session
#You can put them all in a varabile by doing "$myListOfPSSession = New-PSSession ..."
New-PSSession -ComputerName <hostname>[, <hostname>[, ...]] [-Credential mydomain\administrator]

#Create multiple sessions by using a text file with computer names
$listOfSessions = Get-Content c:\my_servers.txt | New-PSSession -ThrottleLimit 20

#Create a ssh session
New-PSSession -ComputerName user@hostname -KeyFilePath c:\\private_key

#list established ps sessions
Get-PSSession [-ComputerName <hostname>]

#use a session
Enter-PSSession <int: id>

#create a session with credentials
$Credentials = Get-Credential
Enter-PSSession -ComputerName <hostname> -Credential $Credentials

#exit a session
Exit-PSSession
#_or
exit

#Disconnect from within a session
#current process is still running until it is blocked or output buffer is full
Disconnect-PSSession [<int: id>]

#kill session
Remove-PSSession [<int: id>]
```

# Check Configuration

```
#show list of users and groups to conect over WinRM
Get-PSSessionConfiguration

#check if connection is possible
Test-WSMan -ComputerName <hostname>

#enable powershell remoting
#run this on the host that does not work
#this works only for hosts in a domain or a private windows network
Enable-PSRemoting -Force
#use this if you want to enable it for a public computer
Enable-PSRemoting -SkipNetworkProfileCheck -Force

#check if winrm service is running
Get-Service WinRM | Select MachineName, Name, Status, StartType
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

* [About PSSessions](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_pssessions?view=powershell-7) - 20200411
* [Enter-PSSession](http://woshub.com/enter-pssession-remote-command-shell/) - 20220119
