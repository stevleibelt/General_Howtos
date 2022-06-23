# How to connect to eduroam with nmcli and nmtui

## Prephrase

Connecting to the eduroam wifi with `WPA2-Enterprise` is not easy doable right now.

In fact it is official [not possible](https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/issues/376) (20220623T10:27:40).

But with a mix of `nmcli` and `nmtui`, it is possible **without** any gui application.

The following steps are tested on arch linux only so far.

## Howto

### Create connection by using nmcli

```bash
#feel free to replace the ifconfig call with your wifi device
#you have to adapt the <username> and the <ream>
nmcli connection add \ 
  type wifi \ 
  con-name "eduroam" \ 
  ifname $(ifconfig | grep -i w | cut -d":" -f 1) \ 
  ssid "eduroam" -- \ 
  wifi-sec.key-mgmt wpa-eap 802-1x.eap peap \ 
  802-1x.phase2-auth mschapv2 802-1x.identity "<user name>@<realm>"
```

### Active connection by using nmtui

Call `nmtui` and active the connection `eduroam`. In this step, you have to provide your password.

If `eduroam` is not available in the connection list, call `systemctl restart NetworkManager.service`

## Links

* Dot-Files of [GallaFrancesco](https://github.com/GallaFrancesco/dotfiles/blob/7ed94659f96ff69a288f8bd48adeca9d43ea5b7c/_scripts/_scripts/add_eduroam.sh) - 20220623T10:26:10

