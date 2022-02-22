# OpenVPN on OpenWRT

## Client

### Cronjob test connection and restart service if connection is down

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
# @since 2022-02-22
# @author stev leibelt <artodeto@bazzline.net>
####

function _main ()
{
    local RESTART_OPENVPN=0

    logger -p debug -t test_connection_restart_openvpn "   starting pinging google"
    #ping google, feel free to ping something else
    ping -c 1 8.8.8.8 &> /dev/null

    if [ \$? -ne 0 ];
    then
        logger -p debug -t test_connection_restart_openvpn "   starting pinging cloudflare"
        #ping cloudflare, feel free to ping something else
        ping -c 1 1.1.1.1 &> /dev/null

        if [ \$? -ne 0 ];
        then
            logger -p info -t test_connection_restart_openvpn "   connection test failed"
            RESTART_OPENVPN=1
        fi
    fi

    if [ \$RESTART_OPENVPN -eq 1 ];
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
