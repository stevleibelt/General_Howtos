# reload available units

    systemctl daemon-reload

# list status of given unit - important for debugging

    systemctl status foo.service

# list current running jobs (good directly after boot to detect slow running processes)

    systemctl list-jobs

# list all available services with current status

    systemctl list-units -t service --all

# list failed units

    systemctl list-units -t service --failed

# list all active services

    systemctl list-units -t service

# list all available targets

    systemctl list-unites -t target --all

# list services triggers by a target

    systemctl show -p "Wants" multi-user.target

# list services that are booted into a specific target

    systemd --test --system --unit=multi-user.target

# list unites that requires given unit

    systemctl show -p WantedBy -p RequiredBy $unitFile

# links

* https://fedoraproject.org/wiki/How_to_debug_Systemd_problems
* https://wiki.archlinux.org/index.php/Systemd#Journal
* http://en.gentoo-wiki.com/wiki/Systemd
