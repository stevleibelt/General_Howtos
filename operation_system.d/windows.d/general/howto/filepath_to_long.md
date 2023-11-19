# Problem

Your filepath has reached the maximum length of 260 characters and you need to fetch/rescue files at the end of the limit.

# Solution

* try to shorten the directory names in the path
* try to mount the last accessable directory in the past as networkdrive
    * this way you are shorten the total filepath
    * move all files out
    * try to shorten the directory and file names

# Links

* [Maximum Path Length Limitation](https://docs.microsoft.com/en-us/windows/win32/fileio/maximum-file-path-limitation) - 20210308
