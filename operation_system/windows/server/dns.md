# From the command line

## Get DNS from a dc

```
Get-DnsServerResourceRecord -ComputerName "<ip address or host name of a dc>" -ZoneName "<your domain>" -Name "<host name>"
```

## Get all DNS entries from a dc

```
Get-DnsServerResourceRecord -ComputerName "<ip address or host name of a dc>" -ZoneName "<your domain>"
```

## Create dynamic entry

```
#login to the host you want to publish
ipconfig /registerdns
```

# From the gui on a dc

## Clear dns cache

* Open `Server-Manager`
* Click on `DNS`
* Rightclick on an entry and choose `DNS-Manager`
* Rightclick your domain entry and choose `Clear Cache`

# Links

* [Get-DnsServerResourceRecord](https://docs.microsoft.com/en-us/powershell/module/dnsserver/get-dnsserverresourcerecord?view=windowsserver2019-ps) - 20210324
* [How to Clear Windows DNS Cache (Server & Workstations)](https://activedirectorypro.com/clear-windows-dns-cache/) - 20181110
* [How to configure DNS dynamic updates in Windows Server 2003](https://docs.microsoft.com/en-us/troubleshoot/windows-server/networking/configure-dns-dynamic-updates-windows-server-2003) - 20200712
