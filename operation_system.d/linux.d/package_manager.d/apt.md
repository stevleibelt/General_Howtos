# APT package manager

## Common commands

```bash
# List installed packages
apt list --installed
#  or
apt-cache pkgnames

# List upgradeable packages
apt-get -s upgrade
# or
apt list --upgradable
```

## Fix `1 not fully installed or removed.`

```bash
apt-get --force-yes remove <string: package_name>
apt-get autoremove
apt-get autoclean
```

