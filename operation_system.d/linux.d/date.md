# Date and time in linux

## Read hardware clock

```bash
hwclock -r
#if you want to know more
hwclock --verbose
```

## Write hardware clock to current system clock

```bash
hwclock -w
```

### With timedatectl

```bash
# read
timedatectl status

# write
timedatectl set-time "yyyy-MM-dd hh:mm:ss"

#enable automatic time synchronization
timedatectl set-ntp 1
```

## Output the timezone difference between you local time and another

Use `tzselect` for that.

You can set a timezone in your current shell by doing something like this:

`TZ='America/Sao_Paulo' LANG='pt_BR.UTF-8' datet`

## Errors

### Failed to set time: Automatic time synchronization is enabled

```bash
#disable automatic time synchronization
timedatectl set-ntp 0
#set your time
timedatectl set-time '1970-01-01 00:00:00'
```

## Links

* https://wiki.archlinux.org/index.php/Hwclock
* http://www.cyberciti.biz/faq/howto-set-date-time-from-linux-command-prompt/
