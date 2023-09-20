# OpenVPN on OpenWRT

## Client

### Cronjob test connection and restart service if connection is down

There will always be an logged error like `cron.err crond[1234]: USER root pid 5678 cmd /root/cronjob/test_connection_and_restart_openvpn.sh`.

This is normal and can't be changed right now.

```
mkdir /root/cronjob

cat > /root/cronjob/test_connection_and_restart_openvpn.sh <<DELIM
#!/bin/sh
####
# Restarts openvpn service if non of the "well known" ip address are pingable
# You have to enable a vpn client config so the restart of the service makes any sense.
####
# @see
#   https://github.com/stevleibelt/General_Howtos/blob/master/operation_system/linux/openwrt/howto/openvpn.md
#   https://openwrt.org/docs/guide-user/base-system/cron
#   https://forum.openwrt.org/t/lede-service-openvpn-start-and-stop-with-uci/20449
#   https://openwrt.org/docs/guide-user/base-system/log.essentials
#   https://forum.openwrt.org/t/cron-err-why/68655/5
# @since 2022-02-22
# @author stev leibelt <artodeto@bazzline.net>
####

function _main ()
{
    local ARRAY_OF_SERVERS_TO_PING=""
    local RESTART_OPENVPN=0

    #just add the server ip address you want to ping here too
    #ARRAY_OF_SERVERS_TO_PING="\${ARRAY_OF_SERVERS_TO_PING} bazzline.net"
    ARRAY_OF_SERVERS_TO_PING="\${ARRAY_OF_SERVERS_TO_PING} 8.8.8.8"    #dns of google
    ARRAY_OF_SERVERS_TO_PING="\${ARRAY_OF_SERVERS_TO_PING} 1.1.1.1"    #dns of cloudflare

    for SERVER_TO_PING in \${ARRAY_OF_SERVERS_TO_PING};
    do
        logger -p debug -t test_connection_restart_openvpn "   starting pinging of >>\${SERVER_TO_PING}<<"

        ping -c 1 \${SERVER_TO_PING} &> /dev/null

        if [ \$? -ne 0 ];
        then
            logger -p info -t test_connection_restart_openvpn "   connection test failed"

            RESTART_OPENVPN=1
        else
            logger -p debug -t test_connection_restart_openvpn "   connection test successful"

            RESTART_OPENVPN=0
            break
        fi
    done

    if [ \${RESTART_OPENVPN} -eq 1 ];
    then
        logger -p notice -t test_connection_restart_openvpn "   starting openvpn restart"

        /etc/init.d/openvpn stop
        /etc/init.d/openvpn start

        logger -p notice -t test_connection_restart_openvpn "   finished openvpn restart"
    else
        logger -p debug -t test_connection_restart_openvpn "   connection is still ok"
    fi
}

_main

DELIM

chmod +x /root/cronjob/test_connection_and_restart_openvpn.sh

cat >> /etc/crontabs/root <<DELIM
*/5 * * * * /root/cronjob/test_connection_and_restart_openvpn.sh

DELIM

/etc/init.d/cron restart

crontab -l
```
