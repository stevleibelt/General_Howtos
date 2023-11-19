# Linux and memory

Your memory is located in `/sys/devices/system/edac/`.

## How to check if your memory is ecc ram

Simple try, just start memtest86++.

Or install `dmidecode` or `edac-utils`.

Execute `sudo dmidecode -t memory` or `edac-utils --status` and check the output.
