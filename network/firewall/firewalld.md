# firewalld

## Usage

### Initial Setup

```
#list available zones
firewall-cmd --get-zones
#list your available interfaces
ip a
#assigne interface <interface> to zone trusted
firewall-cmd --zone=trusted --change-interface=<interface>

#list available services
firewall-cmd --get-services
#assign a service to a zone
firewall-cmd --zone=trusted --add-service=<service name>

#if all is fine
firewall-cmd --runtime-to-permanent
```

## Links

* [firewalld - wiki.archlinux.org](https://wiki.archlinux.org/title/Firewalld) - 20220617T10:51:10

