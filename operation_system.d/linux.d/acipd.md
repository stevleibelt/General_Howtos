# ACIPD

## General information

```bash
# List default handler of any event
cat /etc/acpi/handler.sh

# List available event listener
# This file can be used as template for a given event
# Each script in this path must be executable
# After adding a script you have to `systemctl reload acpid.service`
ls /etc/acpi/events/
```

## Links

* [acpid: archlinux.org](https://wiki.archlinux.org/title/Acpid) - 20251204
* [official homepage: sourceforge.net](https://acpid.sourceforge.net/) - 20251204
