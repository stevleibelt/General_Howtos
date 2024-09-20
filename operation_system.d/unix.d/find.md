# Find

## Examples

```bash
# full qualified name
# ref: https://stackoverflow.com/a/31637405
find /my/path -exec realpath {} \;

# get a file path you can work with
find . -iname "*.sh" -print

# create a file path you can work with in a bash variable
# for the first find result
find . -iname "my*.sh" -type f -print -quit

# find files by user foo or bar
find /my/path \( -user foo -o -user bar \) -ls

# find files by user foo and not in group bar
find /my/path -user foo -not -group bar -ls

# find files by user foo and by size of greater then one mb
find /my/path -user foo -and -size +1M -ls

# find empty files or directories
find . [-maxdepth <integer>] [-type d] [-type f] -empty

# find and move (dealing with whitespaces)
# ref: http://www.cyberciti.biz/tips/howto-linux-unix-find-move-all-mp3-file.html
find . -name "*.*" -print0 | xargs -0 -I {} mv "{}" "<path>"

# filter out hidden files or directories
# ref: http://www.linuxquestions.org/questions/linux-general-1/how-do-i-make-find-exclude-hidden-files-files-613793/
find . [-type f] -not -name ".*"
#_or
find . \( ! -regex '.*/\..*' }) [-type f]

# execute a command for each found filesystem item
# ref: http://stackoverflow.com/questions/5607542/why-does-find-exec-mv-target-not-work-on-cygwin
#execute the command for each file
find . -exec <command or script> {} \;
#e.g.
#   find each *.epub file and copy each found file to /mnt/
find . -iname *.epub -type -f -exec cp -v /mnt/ {} \;

#   find each *.md file and search in the content for the pattern foo bar
#   ref: https://www.shellhacks.com/linux-find-files-by-name-grep-contents/
find . -iname *.md -type f -exec grep -H "foo bar" {} \;

#execute the command and append all the files as arguments
find . -exec <command or script> {} +

# find number of files that are created and older than four hours
find . ! -newerct '4 hours ago' | wc | awk '{print $1}'

# find by permission
find . -perm -o=r

# find by size
find . -size +1G

# find by owner
find . -owner myusername

# delete all files
find /var/log -type f -delete

## delete all .gz and rotated files
find /var/log -type -f -regex ".*\.gz$"
find /var/log -type -f -regex ".*\.[0-9]$"


```

## Find by time

* -amin     -   access in last n minutes
* -atime    -   access time last n*24 hours
* -cmin     -   file status changed in n minutes
* -ctime    -   change time last n\*24 hours
* -mtime    -   modified time last n\*24 hours (n = n+1 day, -n = older than, +n = newer than)

```bash
find . -mtime 0             # find files modified between now and 1 day ago
                            # (i.e., within the past 24 hours)
find . -mtime -1            # find files modified less than 1 day ago
                            # (i.e., within the past 24 hours, as before)
find . -mtime 1             # find files modified between 24 and 48 hours ago
find . -mtime +1            # find files modified more than 48 hours (two days) ago
find . -mtime +3            # find files modified more than 72 hours (three days) ago

find . -mmin +5 -mmin -10   # find files modified between
                            # 6 and 9 minutes ago
```

### GNU find

```bash
find . -newerat '2 hours ago'   # find files accessed last two hours
find . -newerct '2 hours ago'   # find files created last two hours
find . -newermt '2 hours ago'   # find files modified last two hours

find . ! -newerat '2 hours ago'   # find files accessed more than two hours
find . ! -newerct '2 hours ago'   # find files created more than two hours
find . ! -newermt '2 hours ago'   # find files modified more than two hours
```

## Links

* [finduntils](http://www.gnu.org/software/findutils/findutils.html)
* [findcmd](http://content.hccfl.edu/pollock/unix/findcmd.htm)
* [ubuntuusers.de](http://wiki.ubuntuusers.de/find)
* [how to use find](https://opensource.com/article/18/4/how-use-find-linux) - 20180427
