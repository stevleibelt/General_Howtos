# rdfind

A commandline tool to find duplicated files

| Name | Description |
| --- | --- |
| rdfine | Compares file content |
| fsdupes | Compares by md5 checksum or byte-by-byte |
| jdupes | Faster fork of fsdupes |
| rmlint | High performance tool |
| czkawka | Written in rust |

## Usage

```bash
# Scans current directory 
#   and creates results.txt
rdfind .
# Delede duplicates
rdfind . -deleteduplicates true [-dryrun true]
```

## Links

* [disk cleaning: archlinux.org](https://wiki.archlinux.org/title/List_of_applications/Utilities#Disk_cleaning)  - 20251205
