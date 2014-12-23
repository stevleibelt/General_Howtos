# for wlan

## quick and single win

    ```
    echo 'w /sys/class/leds/phy0-led/trigger - - - - phy0radio' > /etc/tmpfiles.d/phy0-led.conf
    systemd-tmpfiles --create phy0-led.conf
    ```

## have it also after reboot

    ```
    sudo touch /etc/modprobe.d/led_wifi.conf
    sudo echo 'options iwlegacy led_mode=1" > /etc/moprobe.d/led_wifi.conf
    ```

## links

* http://askubuntu.com/questions/12069/how-to-stop-constantly-blinking-wifi-led
