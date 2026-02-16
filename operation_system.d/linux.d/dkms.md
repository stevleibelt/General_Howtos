# DKMS

## Usage

```bash
# List all installed modules
dkms status

# Rebuild all installed modules
dkms autoinstall

# Rebuild one module for the currently running kernel
dkms install -m <module name> -v <version>
# Use --all to build for all available kernels
# Use -k <kernel version> to build for a specific kernel
# Example to build zfs for dedicated version
# Based on a debian system
dpkg -l | grep zfs
dkms build -m zfs -v <string: version number>
dkms install -m zfs -v <string: version number>
/sbin/modprobe zfs

# Remove module for all available kernels
dkms remove -m <module name> -v <version> --all

# Fix something like: Error! nvidia/570.86.16 is broken!
cd /var/lib/dkms/nvidia
rm -fr 575.64.05
```

## Links

* [dkms: archlinux.org](https://wiki.archlinux.org/index.php/Dynamic_Kernel_Module_Support#List_modules)
