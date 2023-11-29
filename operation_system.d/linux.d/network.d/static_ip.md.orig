# using systemctl

## create one file per device in /etc/conf.d/

```
cat > /etc/conf.d/network-configuration-<your network device identifier> <<DELIM
address=xxx.xxx.xxx.xx
netmask=xx
broadcast=xxx.xxx.xxx.xxx
gateway=xxx.xxx.xxx.xxx
DELIM
```

## create generic systemd unit file

```
cat > /etc/systemd/system/network@.service <<DELIM
[Unit]
Description=Network startup (%i)
Wants=network.target
Before=network.target
BindsTo=sys-subsystem-net-devices-%i.device
After=sys-subsystem-net-devices-%i.device

[Service]
Type=oneshot
RemainAfterExit=yes
EnvironmentFile=/etc/conf.d/network-configuration-%i
ExecStart=/sbin/ip link set dev %i up
ExecStart=/sbin/ip addr add ${address}/${netmask} broadcast ${broadcast} dev %i
ExecStart=/sbin/ip route add default via ${gateway}
ExecStop=/sbin/ip addr flush dev %i
ExecStop=/sbin/ip link set dev %i down

[Install]
WantedBy=multi-user.target
DELIM
```

## enable device configuration on startup

```
systemctl enable network@<your network device identifier>.service
```
