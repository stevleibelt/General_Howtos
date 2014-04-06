# connection

## connection via transport layer (ssh, rsh)

rsync source:foo/ dest/

## connection via network layer (deamon using tcp port)

rsync source::module /dest

## requesting multiple files from host

rsync -av host:file1 :file2 host:file{3,4} /dest/

# examples and hints

## useful options

* -r - reqcursive
* -u - update (skip files that are newer on the destination)
* -p - preserve permissions
* -A - preserve ACL
* -o - preserve owner
* -g - preserve group
* -t - preserve times
* -z - compress
* -q - show only error messages
* --progress - show progress
* -a - equal to "-rlptgoD" (recursive, recreate symlinks, preserve permission, preserve time, preserver group, preserve owner, preserve device files)
* --delete - deletes files on destination that no longer exists locally
* --dry-run - dry run
