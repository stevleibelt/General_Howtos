# ADGuard Home

## How to use DNS rewrite to propagate local DNS

* Login to adguard
* `Filters` -> `DNS rewrites`
* `Add DNS rewrite`
  * Enter the domain ...: `*.pool.ntp.org`
  * `192.168.0.1` (IP Address of your ntp server)

## How to enabled DHCP server on a truenas scale

This can be complicated if your truenas scale has multiple network interfaces.

> Error: control/dhcp/set_config | enabling dhcp: starting dhcp server: dhcpv4: creating raw udp connection: listen packet aa:bb:cc:dd:ee:ff: socket: operation not permitted | 400
> couldn't listen on :68: listen packet aa:bb:cc:dd:ee:ff: socket: operation not permitted

* Navigate to your apps adguard settings (e.g. `https://<string: ip_of_your_truenas_scale>/ui/apps/installed/community/adguard-home/edit`)
* Go to the setting section `DNS Port`
* Select `Publish port on the host for external access`
* Input `53` to `Port Number`
* Check the checkbox for `DHCP Enabled`
* Make sure you've selected the right `Host IP`

