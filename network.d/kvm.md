# KVM-Switch

KVM is used for **K**eyboard, **V**ideo and **M**ouse.

## Setup encryption for barrier

You should only run and connect with systems that have a public fingerprint.

```bash
# ref: https://wiki.archlinux.org/title/Input_Leap

# server
mkdir -p ~/.local/share/barrier/SSL/Fingerprints;
openssl req -x509 -nodes -days 365 -subj /CN=Barrier -newkey rsa:4096 -keyout ~/.local/share/barrier/SSL/Barrier.pem -out ~/.local/share/barrier/SSL/Barrier.pem;
fingerprint=$(openssl x509 -fingerprint -sha256 -noout -in ~/.local/share/barrier/SSL/Barrier.pem | cut -d"=" -f2);
echo "v2:sha256:$fingerprint" > ~/.local/share/barrier/SSL/Fingerprints/Local.txt;

# client
#   change the following line
YOUR_SYNERGY_SERVER='replace_with_ip_address_or_host_name'
mkdir -p ~/.synergy/SSL/Fingerprints
fingerprint=$(echo -n | openssl s_client -connect $YOUR_SYNERGY_SERVER:24800 2>/dev/null | openssl x509 -sha256 -noout -fingerprint | cut -d"=" -f2);
echo "v2:sha256:$fingerprint" > ~/.synergy/SSL/Fingerprints/TrustedServers.txt
```

## Setup ufw for barrier

```bash
# server
sudo ufw allow from <string: client_hostname_or_ip_address> proto tcp to any port 24800 comment "barrier from <string: client_hostname>"

# client
sudo ufw allow from <string: server_hostname_or_ip_address> proto tcp to any port 24800 comment "barrier from <string: server_hostname>"
```

## Setup autostart

## Links

* [Arch linux wiki page: wiki.archlinux.org](https://wiki.archlinux.org/title/Input_Leap) - 20240507
* [Barrier: github.com](https://github.com/debauchee/barrier) - Fork from synergy-core (stable but outdated) - 20240507
* [Input-Leap: github.com](https://github.com/input-leap/input-leap) - Fork from barrier (no release candidate yet) - 20240507
* [Synergy: symless.com](http://symless.com/synergy) - The initial, in the past open source, virtual kvm-switch - 20240507
