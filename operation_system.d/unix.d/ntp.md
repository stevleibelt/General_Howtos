# NTP

## Setup

```bash
# Install ntp
# Open /etc/ntp.conf

# Restrict to local network 192.168.0.0/24
restrict 192.168.0.0 mask 255.255.255.0 nomodify notrap

# Restart on each change
# sudo systemctl restart ntp

# Check status
# sudo systemctl status ntp

# Check taht server is synchronizing
# ntpq -p

# Enable ntp on boot
# sudo systemctl enable ntp
```
