# Commands

If you run `load compact <path>`, the `<path>` either points to a `.nsf` file or to a path containing `.nsf` files.
You can use a `.IND` (indirect) file to ease up maintaining a list of files.

## .IND file example

```
#cat weekly.ind
foo.nsf
bar.nsf
baz\foo.nsf
baz\bar.nsf
```

## In-place compacting with space recovery only

```
#database can be accessed and changed during compacting
#   file size is not reduced
load compact -b <path>
```

## In-place comapcting with space recovery and file size reduction

```
#database can be accessed and changed during compacting
#slower than `-b`
#assings new DBIIDs to the database
#should be run once a week or month on all databases
load compact -B <path>
```

## Copy-style compacting

```
#database can be accessed (if `-L` is used) but not changed during compacting
#read old database and write not deleted data to new database
#old database is deleted/replaced by new one
#assings new DBIIDs to the database
#takes the most time *but* has the highest chance to fix a broken database
load compact -c <path>
```

## Shit hits the fan emergency handling

```
load fixup -f <database>.nsf
load compact -B <database>.nsf
load compact -c <database>.nsf
```

# Options

| Option | Description |
| --- | --- |
| `-s <percent>` | Compact database if more than the percent amount of *s*pace can be reclaimed. Space calculation ist not reliable. |
| `-D` | *D*iscard any built view indexes. Usefull if database is not active used anymore. |
| `-b` | In-Place compacting without file size reduction (recommented). |
| `-B` | In-Place compacting with file size reduction. |
| `-c` | *C*opy style compacting. Useful to solve corruption and other advanced issues. |
| `-L` | A*l*lows database reading when compacting with copy style. |
| `-i` | *I*gnore errors when using copy style compacting. |
| `-REPLICA` | Creates a replica in the background. Source is accessible during compacting except in the second of the renaming. |
| `-IDS_FULL=<percent>` | Creates replica only if percent of IDs are used. |
| `-REN_WAIT=<minutes>` | Waits minutes before renaming the replica. |
| `-RESTART` | If replica can not be created, restart the server process and rename the replica afterwards. |
| `-ZU` | Upgrades compression to LZ1 compression. |
| `-R` | *R*everts database to previous release of specific database (8 to 7 etc.). Uses copy-style compacting. |
| `-r` | *R*everts database to previous release of the server (8 to 7 etc.). Uses copy-style compacting. |

# Link

* [Ways to compact databases](https://help.hcltechsw.com/domino/10.0.1/tune_waystocompactdatabases_t.html) - 20200929
    * [Compacting databases](https://help.hcltechsw.com/domino/10.0.1/tune_compactingdatabases_c.html) - 20200929
    * [Running Compact using a Program document](https://help.hcltechsw.com/domino/10.0.1/tune_runningcompactusingaprogramdocument_t.html) - 20200929
    * [Compact options](https://help.hcltechsw.com/domino/10.0.1/tune_compactoptions_r.html) - 20200929
