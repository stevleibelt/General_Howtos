# connection

## connection via transport layer (ssh, rsh)

    rsync source:foo/ destination/

## connection via network layer (deamon using tcp port)

    rsync source::module /destination

## requesting multiple files from host

    rsync -av host:file1 :file2 host:file{3,4} /dest/

## using ssh and key

    rsync --delete -a /source/ -e "ssh -i /home/<user>/.ssh/<key>" <user>@<host>:/destination/

# examples and hints

## useful options

* -r                    -   recursive
* -u                    -   update (skip files that are newer on the destination)
* -p                    -   preserve permissions
* -A                    -   preserve ACL
* -o                    -   preserve owner
* -g                    -   preserve group
* -t                    -   preserve times
* -z                    -   compress
* -q                    -   show only error messages
* --progress            -   show progress
* -a                    -   equal to "-rlptgoD" (recursive, recreate symlinks, preserve permission, preserve time, preserver group, preserve owner, preserve device files)
* --delete              -   deletes files on destination that no longer exists locally
* --dry-run             -   dry run
* --exclude <directory> -   exclude <directory>
* -l                    -   --links copy symlinks as symlinks
* -L                    -   --copy-links transform symlink into referent file/dir
* --copy-unsafe-links   -   only "unsafe" symlinks are transformed
* --safe-links          -   ignore symlinks that point outside the tree

# links

* http://www.thegeekstuff.com/2011/01/rsync-exclude-files-and-folders/
* http://linux.about.com/library/cmd/blcmdl1_rsync.htm
