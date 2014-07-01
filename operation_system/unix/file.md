# file

use command 'file' to determine the file format

# create multiple files at once

## create foo1 foo2 foo3 foo4

touch foo{1,2,3,4}

# rename

    rename oldname newname files

## example

    rename oldPrefix- newPrefix- oldPrefix-*
    rename .oldSuffix .newSuffix *.oldSuffix

### parameters

* -v - verbose
* -n - testrune (not available everywhere)

# set sticky bit

    chmod +t -R *

# set gid

    chmod g+s -R *

# links

* http://tips.webdesign10.com/how-to-bulk-rename-files-in-linux-in-the-terminal
