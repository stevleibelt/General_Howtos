# file

use command 'file' to determine the file format

## Examples

```bash
# create multiple files at once
## creates foo1 foo2 foo3 foo4
touch foo{1,2,3,4}

# rename
rename oldname newname files
rename oldPrefix- newPrefix- oldPrefix-*
rename .oldSuffix .newSuffix *.oldSuffix

# set sticky bit
chmod +t -R *

# set gid
chmod g+s -R *
```

## Parameters

* -b        -   brief mode
* -i        -   charset (--mime)
* -n        -   testrune (not available everywhere)
* -v        -   verbose

## Links

* http://tips.webdesign10.com/how-to-bulk-rename-files-in-linux-in-the-terminal
