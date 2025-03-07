# Tune PC-Engines APU2C4

ref: https://forum.opnsense.org/index.php?topic=6590.0

Use [LibreSpeed](https://librespeed.org/) to test the internet connection speed.

## Fetch general information

```bash
# Check if flow controll exits for your devices
# ref: https://forum.opnsense.org/index.php?msg=96409
sysctl -a | grep -v arp | grep 'fc:\|\.fc\|_fc'
```

## Tune the system

Clickpath: `System` -> `Settings` -> `Tunables`

Click on `+` to add a tunable if it does not exist.

```bash
# ref: https://forum.netgate.com/topic/133907/pc-engines-apu2c4-download-bandwidth-half-of-upload
# ref: https://docs.netgate.com/pfsense/en/latest/hardware/tune.html
# ref: https://teklager.se/en/knowledge-base/opnsense-performance-optimization/

# Disable flow control
dev.igb.2.fc="0" #Disable flow control on dev 2
dev.igb.1.fc="0" #Disable flow control on dev 1
dev.igb.0.fc="0" #Disable flow control on dev 0

# Enable TCP Offload Engine
net.inet.tcp.tso="1"

# Enable Hardware Checksum Offloading
net.inet.udp.checksum="1"

# Enable multi queue processing
hw.igb.rx_process_limit="-1" #Multi queue processing rx
hw.igb.tx_process_limit="-1" #Multi queue processing tx
legal.intel_igb.license_ack="1" #Multi queue processing licence

# Increase the amount of network memory buffers
kern.ipc.nmbclusters="1000000"

# Disable Message Signaled Interrupts
hw.pci.enable_msix="0"
hw.pci.enable_msi="0"
```

Clickpath: `Interfaces` -> `Settings`

* `Hardware CRC`: disabled
* `Hardware TSO`: disabled
* `Hardware LRO`: disabled

Clickpath: `Service` -> `Intrusion Detection` -> `Administration`

ref: https://forum.opnsense.org/index.php?topic=6590.45

* Detection:
  * Pattern matcher:
    * `Hyperscan` or `Aho-Corasick`

## Update BIOS

Login via ssh and become root.

```bash
# ref: https://teklager.se/en/knowledge-base/apu-bios-upgrade/
pkg install -y flashrom

# Fetch latest bios rom file
# ref: https://pcengines.github.io/
# ref: https://www.pcengines.ch/apu2c4.htm
curl -o apu2_v4.19.0.1.rom https://dl.3mdeb.com/open-source-firmware/pcengines/apu2/apu2_v4.19.0.1.rom
curl -o apu2_v4.19.0.1.rom.SHA265 https://dl.3mdeb.com/open-source-firmware/pcengines/apu2/apu2_v4.19.0.1.SHA256
sha256sum -c apu2_v4.19.0.1.rom.SHA265

# flash it
flashrom -w apu2_v4.19.0.1.rom -p internal:boardmismatch=force [-c W25Q64BV/W25Q64CV/W25Q64FV]
```

If you get the following error:
> This coreboot image (PC Engines:apu2) does not appear to
> be correct for the detected mainboard (PC Engines:PC Engines apu2).
This [can happen](https://forum.netgate.com/topic/120380/pc-engines-apu2-bios-options/32) but a reboot should work.
