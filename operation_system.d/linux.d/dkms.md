# DKMS

## Usage

```bash
#list all installed modules
dkms status

#rebuild all installed modules
dkms autoinstall

#rebuild one module for the currently running kernel
dkms install -m <module name> -v <version>
#use --all to build for all available kernels
#use -k <kernel version> to build for a specific kernel

#remove module for all available kernels
dkms remove -m <module name> -v <version> --all
```

## Links

* https://wiki.archlinux.org/index.php/Dynamic_Kernel_Module_Support#List_modules
