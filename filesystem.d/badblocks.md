# Badblocks

The command badblocks ins included in the `e2fsprogs`, at least in arch linux.

Badblocks is writing and reading the full disk multiple times with the followung patterns:

* `0xaa (10101010)`
* `0x55 (01010101)`
* `0xff (11111111)`
* `0x00 (00000000)`

You can run the test in parallel by using [bht](https://github.com/ezonakiusagi/bht).

## Usage

```bash
badblocks -v /dev/<device>
```

## Links

* https://wiki.archlinux.org/index.php/Badblocks
* https://en.wikipedia.org/wiki/Badblocks
* https://en.wikipedia.org/wiki/E2fsprogs
* [Bulk hdd testin with badblocks script: github.com](https://github.com/ezonakiusagi/bht) - 20240101
