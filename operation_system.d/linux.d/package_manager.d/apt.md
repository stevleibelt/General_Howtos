# APT package manager

## Common commands

```bash
#list installed packages
sudo apt list --installed
```

## Fix `1 not fully installed or removed.`

```bash
apt-get --force-yes remove <string: package_name>
apt-get autoremove
apt-get autoclean
```

