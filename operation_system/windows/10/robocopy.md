# robocopy

```
#my default call to make an exact copy
robocopy.exe <source> <destination> /MIR /FFT /COPY:DATSOU /DCOPY:DAT /W:5 /R:10 /XF "*.TMP" "*.log" /XD "TEMP" "CACHE" /XJ /SL /NS /NC /NFL /NDL /NJH /NP

#/B - can be used to copy files without having the rights if you are an administrator on source and destination side
#/FFT - assume fat file times
#/MIR - mirror (purge not existing files and copy subdirectories including empty ones)
#/COPY:DATSOU - copy Data, Attributes, Timestamps, Security (ntfs acls), Owner and aUditing
#/DCOPY:DAT - copy Data, Attributes and Timestamp of directories
#/SL - transfer a symolic link into a full copy
#/XJ - eXclude Junction points and symbolic links
#/XD [directory] - exclude directory
#/XF [files] - exclude files
#/Z - copie files in rescumeable mode which could decrease speed to 1/4
#/R:5 - retry 60 times
#/W:3 - wait 5 seconds between retry
#/NS - no file size
#/NC - no file classes
#/NFL - no file list
#/NDL - no directory list
#/NJH - no job header
#/NJS - no job summary
#/NP - No progress
#/LOG:<filename> - write into this file name
#/LOG:+<filename> - append writing into this file name
```

# links

* [official microsoft documentation](https://docs.microsoft.com/en-US/windows-server/administration/windows-commands/robocopy)
