# Find

## Examples

```bash
# Full qualified name
# ref: https://stackoverflow.com/a/31637405
find /my/path -exec realpath {} \;

# Get a file path you can work with
find . -iname "*.sh" -print

# Create a file path you can work with in a bash variable
#   for the first find result
find . -iname "my*.sh" -type f -print -quit

# Find files without a extension
find . ! -iname "*.*" -type f
# Add the extension `.bazzline` to all files without an extension
find . ! -iname "*.*" -type f -exec mv {} {}.bazzline \;

# Calculate max level depth from current working directory
#   `-printf '%d\n'`: `%d` expands/converts the directory name to the current level, `\n` adds a new line
#   `sort -n`: Sort the result in natural way descending
#   `tail -n1`: List the last line of the output
find . -type d -printf '%d\n' | sort -n | tail -n1

# Find directories and add a suffix to them.
# Important, you have to do this level by level to not run into errors.
# Either by "from max level to current level"  or "from current level to max level"
# You could automate this by running find without level limitation and calculate the
#   existing max level
# The follwing code will produce an error since "." can not be moved.
find . -mindepth 1 -maxdepth 1 -type d -exec mv {} {}.d \;

# Find files by user foo or bar
find /my/path \( -user foo -o -user bar \) -ls

# Find files by user foo and not in group bar
find /my/path -user foo -not -group bar -ls

# Find files by user foo and by size of greater then one mb
find /my/path -user foo -and -size +1M -ls

# Find empty files or directories
find . [-maxdepth <integer>] [-type d] [-type f] -empty

# Find and move (dealing with whitespaces)
# ref: http://www.cyberciti.biz/tips/howto-linux-unix-find-move-all-mp3-file.html
find . -name "*.*" -print0 | xargs -0 -I {} mv "{}" "<path>"

# Filter out hidden files or directories
# ref: http://www.linuxquestions.org/questions/linux-general-1/how-do-i-make-find-exclude-hidden-files-files-613793/
find . [-type f] -not -name ".*"
#_or
find . \( ! -regex '.*/\..*' }) [-type f]

# Execute a command for each found filesystem item
# ref: http://stackoverflow.com/questions/5607542/why-does-find-exec-mv-target-not-work-on-cygwin
find . -exec <command or script> {} \;
# E.g.
#   find each *.epub file and copy each found file to /mnt/
find . -iname *.epub -type -f -exec cp -v /mnt/ {} \;

#   Find each *.md file and search in the content for the pattern foo bar
#   ref: https://www.shellhacks.com/linux-find-files-by-name-grep-contents/
find . -iname *.md -type f -exec grep -H "foo bar" {} \;

# Execute the command and append all the files as arguments
find . -exec <command or script> {} +

# Find number of files that are created and older than four hours
find . ! -newerct '4 hours ago' | wc | awk '{print $1}'

# Find by permission
find . -perm -o=r

# Find by size
find . -size +1G

# Find by owner
find . -owner myusername

# Delete all files
find /var/log -type f -delete

## Delete all .gz and rotated files
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
