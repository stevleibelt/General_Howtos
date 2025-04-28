# Pi-Hole

## Usage and usefull commands

If you install it on a debian or fedora system use `curl -sSL https://install.pi-hole.net | bash` [source](https://github.com/pi-hole/pi-hole/#one-step-automated-install).

```bash
# update password
pihole -a -p <password>

# enable systemd services
systemctl enable pihole-FTL.service 
systemctl disable systemd-resolved
systemctl stop systemd-resolved
systemctl start pihole-FTL.service 
```

## pihole cli

```bash
Usage: pihole [options]
Example: 'pihole -w -h'
Add '-h' after specific commands for more information on usage

Whitelist/Blacklist Options:
  -w, whitelist       Whitelist domain(s)
  -b, blacklist       Blacklist domain(s)
  -wild, wildcard     Blacklist domain(s), and all its subdomains
                        Add '-h' for more info on whitelist/blacklist usage

Debugging Options:
  -t, tail            View the live output of the Pi-hole log

Options:
  -a, admin           Admin Console options
                        Add '-h' for more info on admin console usage
  -c, chronometer     Calculates stats and displays to an LCD
                        Add '-h' for more info on chronometer usage
  -g, updateGravity   Update the list of ad-serving domains
  -h, --help, help    Show this help dialog
  -l, logging         Specify whether the Pi-hole log should be used
                        Add '-h' for more info on logging usage
  -q, query           Query the adlists for a specified domain
                        Add '-exact' AFTER a specified domain for exact match
  -v, version         Show installed versions of Pi-hole, Admin Console & FTL
                        Add '-h' for more info on version usage
  status              Display the running status of Pi-hole subsystems
  enable              Enable Pi-hole subsystems
  disable             Disable Pi-hole subsystems
                        Add '-h' for more info on disable usage
  restartdns          Restart Pi-hole subsystems
```

## Configuration files

```bash
/etc/pihole/pihole-FTL.conf
```

## Testing

You should run the tests once with providing the ip address of your pi-hole and a second time without providing the ip address of your pi-hole.   
If both tests are generating the right results, you have verified that all clients using the pi-hole as dns server.

```bash
# Linux
# Should work
dig @<ip of pi-hole> google.com
# Should be blocked
dig @<ip of pi-hole> s.amazon-adsystem.com

# Windows
# Should work
Resolve-DnsName -Server <ip of pi-hole> -Name google.com 
# Should be blocked
Resolve-DnsName -Server <ip of pi-hole> -Name s.amazon-adsystem.com
```

## Links

* [Pi-hole - arch linux wiki](https://wiki.archlinux.org/index.php/Pi-hole)
* [Install Pi hole on arch](https://blog.jenningsga.com/install-pi-hole-on-arch/) - 2017-02-19
* [Official Pi-Hole documentation](https://docs.pi-hole.net/)
* [Official Pi-Hole Configuration](https://docs.pi-hole.net/ftldns/configfile/)
* [Raspberry Pi 3 with Pi-Hole, OpenVpn and DNSCrypt](https://itchy.nl/raspberry-pi-3-with-openvpn-pihole-dnscrypt) - 2018-04-07
