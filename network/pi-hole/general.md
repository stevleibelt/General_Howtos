# Usage

## Usefull commands

```
# update password
pihole -a -p <password>

# enable systemd services
systemctl enable pihole-FTL.service 
systemctl disable systemd-resolved
systemctl stop systemd-resolved
systemctl start pihole-FTL.service 
```

## pihole cli

```
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

```
/etc/pihole/pihole-FTL.conf
```

# Installation

## On Archlinuxarm

```
mkdir -p software/source/org/archlinux/aur
cd software/source/org/archlinux/aur
git clone https://aur.archlinux.org/pi-hole-ftl.git
cd pi-hole-server
makepkg -sri
sudo pacman -U *.tar.xz
cd ../
git clone https://aur.archlinux.org/pi-hole-server.git
cd pi-hole-server
makepkg -sri
sudo pacman -U *.tar.xz
```

# Testing

```
# should work
dig @<ip of pi-hole> google.com

# should be blocked
dig @<ip of pi-hole> s.amazon-adsystem.com
```

# Error fixing

## DNS resolution fails

If you could please try the following steps:

    Restore /etc/resolve.conf to its initial default state - contains:
    nameserver 127.0.0.1

    Check that /etc/systemd/resolved.conf contains
    DNSStubHandler=no

    Force a reload of all of systemd-resolved's configuration files
    sudo systemctl reload-or-restart systemd-resolved

    Repair Pi-hole (to ensure dnsmasq's config files are correct)
    pihole -r

    Then, if you could please report the output of
    systemctl status dnsmasq.service systemd-resolved

Should they not both be running:

    if you could please try:
    sudo systemctl daemon-reload

    then once again
    pihole -r

    and once again, please report the output of
    systemctl status dnsmasq.service systemd-resolved
```

[source](https://github.com/pi-hole/pi-hole/issues/2179)

# Link

* [Pi-hole - arch linux wiki](https://wiki.archlinux.org/index.php/Pi-hole)
* [Install Pi hole on arch](https://blog.jenningsga.com/install-pi-hole-on-arch/) - 2017-02-19
* [Official Pi-Hole documentation](https://docs.pi-hole.net/)
* [Official Pi-Hole Configuration](https://docs.pi-hole.net/ftldns/configfile/)
