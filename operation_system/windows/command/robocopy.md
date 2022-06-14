# Robocopy

## Usage

```
#my default simple usage
robocopy.exe <source> <destination> /Z /ZB /MIR  /R:5 /W:5 /TBD /NP

#my default call to make an exact copy
robocopy.exe <source> <destination> /MIR /FFT /COPY:DATSOU /DCOPY:DAT /W:5 /R:5 /XF "*.TMP" "*.log" /XD "TEMP" "CACHE" /XJ /SL /NS /NC /NFL /NDL /NJH /NP /TBD /Z /ZB

#/B - can be used to copy files without having the rights if you are an administrator on source and destination side
#/COPY:DATSOU - copy Data, Attributes, Timestamps, Security (ntfs acls), Owner and aUditing
#/DCOPY:DAT - copy Data, Attributes and Timestamp of directories
#/FFT - assume fat file times
#/MIR - mirror (purge not existing files and copy subdirectories including empty ones)
#/LOG:<filename> - write into this file name
#/LOG:+<filename> - append writing into this file name
#/NC - no file classes
#/NDL - no directory list
#/NFL - no file list
#/NJH - no job header
#/NJS - no job summary
#/NS - no file size
#/NP - No progress
#/R:5 - retry 5 times
#/SL - transfer a symolic link into a full copy
#/TBD - system should wait for names (error 67)
#/W:5 - wait 3 seconds between retry
#/XD [directory] - exclude directory
#/XF [files] - exclude files
#/XJ - eXclude Junction points and symbolic links
#/Z - restart current copy if something went wrong
#/ZB - copies files in restart mode if an error has happend, uses "savemode" if copy is still not possible
```

# Create Scheduled Task

* Create your robocopy command line call and save it to a file located on your local drive (name it like `sync_<source>_to_<destination>.bat`)
* Open search `Win+S`
* Enter `schedule task`
* `Task Scheduler (Local)` -> `Task Scheduler Library`
* Rightclick -> `new directory`
* Give it a good name like `<user_name>`
* Rightlick on the new directory -> `Create Basic Task...`
* Enter a good name like `sync <source> to <destination>`
* Enter a good description, if needed
* Click on `Next`
* Select a fitting trigger (`daily` at `12:30:00` is a good schedule)
* Click on `Next`
* Select action `start a program`
* Click on `Next`
* Enter the path to your initial created `*.bat` file
* Click on `Next`
* Add a check to `Open the Properties dialog ...`
* Click on `Finish`
* Depending on your task, you maybe need to:
    * Configure `Change User or Group...`
    * Select `run wheter user is logged on or not`
    * Check `Run with highest privileges`
* Select the tab `Settings`
    * Configure `Stop the task if it runs longer than:` to `1 day`
* Click on `OK`

You can now test the task by rightclicking on the task and select `Run`

You can now test the task by rightclicking on the task and select `Run`.

# Links

* [official microsoft documentation](https://docs.microsoft.com/en-US/windows-server/administration/windows-commands/robocopy)
