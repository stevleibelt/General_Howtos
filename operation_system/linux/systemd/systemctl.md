# reload available units

```
systemctl daemon-reload
```

# list status of given unit - important for debugging

```
systemctl status foo.service
```

# list current running jobs (good directly after boot to detect slow running processes)

```
systemctl list-jobs
```

# list all available services with current status

```
systemctl list-units -t service --all
```

# list failed units

```
#all failed unites
systemctl list-units --failed

#of type service
systemctl list-units -t service --failed
```

# list all active services

```
systemctl list-units -t service
```

# list all available targets

```
systemctl list-unites -t target --all
```

# list services triggers by a target

```
systemctl show -p "Wants" multi-user.target
```

# list services that are booted into a specific target

```
systemd --test --system --unit=multi-user.target
```

# list unites that requires given unit

```
systemctl show -p WantedBy -p RequiredBy $unitFile
```

# create a drop-in snippet or a whole replacment file

```
#create snippet
systemctl edit <service unit file>

#create whole new file
systemctl edit --full <service unit file>
```

# links

* [using the systemctl command to manage systemd units - opensource.com](https://opensource.com/article/20/5/systemd-units) - 2020-05-07
* https://fedoraproject.org/wiki/How_to_debug_Systemd_problems
* https://wiki.archlinux.org/index.php/Systemd#Journal
* http://en.gentoo-wiki.com/wiki/Systemd
