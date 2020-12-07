# Generall

* systemd will replace `%i` inside the script with anything typed after the `@` symbole of a systemd unit file
    * e.g. `httpd@mysubdomain.service` -> `%i` inside the systemd unit file (like the path to the source) will be replaced with `mysubdomain`

# Examples

## Service file executing a shell script

We have to write two scripts. One defines the service itself, the other one contains the workload (what should be done) when the service is started or stopped.

### Step one

Write the service file.

* create your own unit below /lib/systemd/system/my.service
* take a look to
    * https://wiki.archlinux.org/index.php/Systemd#Writing_custom_.service_files
    * http://www.freedesktop.org/software/systemd/man/systemd.service.html

```
[Unit]
Description="something usefull in here"
#the service file is a wrapper. the real action is done in the on the following line (should be set with +x)
ConditionPathExists=/my/path/to/the/execute/script
#two example targets below
Before=network.target
Wants=network.target

[Service]
#we only want to execute a script by the service - fire and forget - one shot only ;-)
Type=oneshot
RemainAfterExit=yes
KillMode=none
#the following two lines define what should happen when the service is started or stopped
ExecStart=/my/path/to/the/execute/script start
ExecStop=/my/path/to/the/execute/script stop

[Install]
WantedBy=multi-user.target
```

### Step two

Write the shellscript.

```
#The following script is simple, it should start wpa_supplicant, wait three seconds and start dhcpcd for wlan0
#!/bin/bash
####
# Simple script to start and stop wpa_supplicant based wlan0 interface
#
# @author stevleibelt
# @since 2012-11-30
#####

case "$1" in
  "start")
        wpa_supplicant -B -D wext -i wlan0 -c /etc/wpa_supplicant.conf
        sleep 3
        dhcpcd -b wlan0
  ;;
  "stop")
        dhcpd wlan0 --exit
  ;;
esac

exit 0
```

# links

* [Manage multiple service instances with systemctl](https://opensource.com/article/20/12/multiple-service-instances-systemctl) - 20201207
