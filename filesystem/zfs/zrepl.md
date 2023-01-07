# zrepl

## Installation

```
#build it from source
yay -S zrepl

#use binaries
yay -S zrepl-bin
```

## Basic zrepl.yml as replacement for zfs-snap-manager

```bash
#cat /etc/zrepl/zrepl.yml
jobs:
-type: snap
  name: <string: job name>
  filesystems: {
    "<string: zpool[/dataset]<": true,
    "<string: zpool[/dataset2]<": true,
    "<string: zpool2[/dataset]<": true,
  }
  snapshotting:
    type: periodic
    interval: 24h
    prefix: zrepl_<string: job name>_
  pruning:
    keep:
      - type: last_n
        count: <int: number_of_snapshoots_to_keep>
```

## Usage of the cli

```bash
#verify configuration
zrepl configcheck --config /etc/zrepl/zrepl.yml

#see status
zrepl status

#list used filesystems for a job
zrepl test filesystems --job snapjob --all

#start job per hand
zrepl signal wakeup <string: jobname>
```

## Link

* [zrepl - official homepage](https://zrepl.github.io)

