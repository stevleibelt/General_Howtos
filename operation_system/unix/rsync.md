# connection

## connection via transport layer (ssh, rsh)

```
rsync source:foo/ destination/
```

## connection via network layer (deamon using tcp port)

```
rsync source::module /destination
```

## requesting multiple files from host

```
rsync -av host:file1 :file2 host:file{3,4} /dest/
```

## using ssh

```
rsync -avz -e ssh source/file <user>@<host>:/destination
```

For each <user>@<host> combination you use, you have to create a section in your `.ssh/config` file.

```
Host <identifier>
    Hostname <host name>
    User <user name>
    IdentityFile ~./ssh/<file name>

#or as example
Host bazzline.net
    Hostname bazzline.net
    User artodeto
    IdentityFile ~./ssh/net_bazzline_artodeto
```

```
rsync --delete -a /source/ -e ssh <user>@<host>:/destination/
#speed up
#@see: http://www.smork.info/blog/2013/04/24/entry130424-163842.html
rsync --delete -a /source/ -e "ssh -c arcfour -o Compression=no" <user>@<host>:/destination/
```

## limit speed

```
rsync --bwlimit=<kb/second> <source> <dest>
```

## :

# hints

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

# clients

* [zsync](http://zsync.moria.org.uk/)

# links

* http://www.cyberciti.biz/faq/create-ssh-config-file-on-linux-unix/
* http://www.thegeekstuff.com/2011/01/rsync-exclude-files-and-folders/
* http://linux.about.com/library/cmd/blcmdl1_rsync.htm
* https://www.digitalocean.com/community/tutorials/how-to-copy-files-with-rsync-over-ssh
* http://troy.jdmz.net/rsync/index.html
* https://www.digitalocean.com/community/tutorials/how-to-copy-files-with-rsync-over-ssh
* http://www.thegeekstuff.com/2011/07/rsync-over-ssh-without-password
* https://calomel.org/rsync_tips.html
* http://nerderati.com/2011/03/17/simplify-your-life-with-an-ssh-config-file/
* https://opensource.com/article/17/1/rsync-backup-linux
