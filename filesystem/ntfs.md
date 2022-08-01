# NTFS

## Windows Checkdisk

```
#WIN+R (as administrator)
#run check disk
#   /f  - fix the errors
#   /r  - locate bad sectors and try to mark them
#   /x  - force a dismount
#   c:  - the drive you want to check
chkdsk /f /r /x c:
```

