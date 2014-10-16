# general

* [homepage](http://www.cis.upenn.edu/~bcpierce/unison/)
* [documentation](http://www.seas.upenn.edu/~bcpierce/unison/download/releases/stable/)
    * [tutorial](http://www.seas.upenn.edu/~bcpierce/unison/download/releases/stable/unison-manual.html#tutorial)
    * [ignore section](http://www.seas.upenn.edu/~bcpierce/unison/download/releases/stable/unison-manual.html#ignore)
    * [symbolic link section](http://www.seas.upenn.edu/~bcpierce/unison/download/releases/stable/unison-manual.html#symlinks)
    * [preference section](http://www.seas.upenn.edu/~bcpierce/unison/download/releases/stable/unison-manual.html#prefs)
    * [faq](http://www.cis.upenn.edu/~bcpierce/unison/faq.html)
* [wikipedia](https://en.wikipedia.org/wiki/Unison_(file_synchronizer))
* [linuxjornal.com](http://www.linuxjournal.com/article/7712)
* available for arm arch linux
* configuration files in "~/.unison"
* a file called "DANGER.README" will be created if manual cleanup may be required because of the fact that unison was interrupted
* unison does not understand hard links.

# how to

## help on comands

Simple typ "?" and read the output.

## commands for conflict mode

* f         -   follow unisons recommendation
* I         -   ignore this path permanently
* E         -   permanently ignore files with this extension
* N         -   permanently ignore paths ending with this name
* m         -   merge the versions
* d         -   show differences
* x         -   show details
* L         -   list all suggested changes tersely
* l         -   list all suggested changes with details
* p or b    -   go back to previous item
* g         -   proceed immediately to propagating changes
* q         -   exit unison without propagating any changes
* /         -   skip
* > or .    -   propagate from left to right
* < or ,    -   propagate from right to left

## commands for propagating updates

* y or g    -   yes
* n         -   no
* q         -   quit

## check of remote shell method is possible

    ssh <remote host> unison -version
    unison -testServer <local directory path> ssh://<remote host>/<remote directory path>

## synchronize with remote directory via ssh

    unison <local directory path> ssh://<remote host>/<relative remote directory path>
    # absolute path
    unison <local directory path> ssh://<remote host>//<absolute remote directory path>
    # different user name
    unison <local directory path> ssh://<user name>@<remote host>//<absolute remote directory path>
    # syncronize only some path, relative to home
    unison <local directory path> ssh://<user name>@<remote host>//home/<user name> \
        - path <directory one> \
        [- path <diretory two>]

## syncrhonizing more than two machines

* simple build a star topology
* one hub/main
* all others client to the hub/main

## tunnel through ssh

Simple prefix your directory location with "ssh://"

## configuration for beginners

    merge = diff3 -m CURRENT1 OLD CURRENT2 > NEW
    backup = Name *
    maxbackups = 3
    log = true
    logfile = ~/.unison/unison.log
    rshargs = -C
    #auto = true    #no asking for non-conflicting changes
    #batch = true   #no asking at all, conflicts will be skipped
    #silent = true  #outputs only errors
    #follow = true  #treat symboloc links as real filesystem item not as reference (copy content)
    #group = true   #synchronize group id
    #owner = true   #synchronize owner id
    #perms = true   #synchronize permissions

# examples

# options

## basic

* -auto             -   automatically accept default (nonconflicting) actions
* -batch            -   batch mode: ask no questions at all
* -doc xxx          -   show documentation ('-doc topics' lists topics)
* -fat              -   use appropriate options for FAT filesystems
* -group            -   synchronize group attributes
* -ignore xxx       -   add a pattern to the ignore list
* -ignorenot xxx    -   add a pattern to the ignorenot list
* -nocreation xxx   -   prevent file creations on one replica
* -nodeletion xxx   -   prevent file deletions on one replica
* -noupdate xxx     -   prevent file updates and deletions on one replica
* -owner            -   synchronize owner
* -path xxx         -   path to synchronize
* -perms n          -   part of the permissions which is synchronized
* -root xxx         -   root of a replica (should be used exactly twice)
* -silent           -   print nothing except error messages
* -terse            -   suppress status messages
* -testserver       -   exit immediately after the connection to the server
* -times            -   synchronize modification times
* -version          -   print version and exit

## advanced

* -addprefsto xxx           -   file to add new prefs to
* -addversionno             -   add version number to name of unison on server
* -backup xxx               -   add a pattern to the backup list
* -backupcurr xxx           -   add a pattern to the backupcurr list
* -backupcurrnot xxx        -   add a pattern to the backupcurrnot list
* -backupdir xxx            -   directory for storing centralized backups
* -backuploc xxx            -   where backups are stored ('local' or 'central')
* -backupnot xxx            -   add a pattern to the backupnot list
* -backupprefix xxx         -   prefix for the names of backup files
* -backups                  -   keep backup copies of all files (see also 'backup')
* -backupsuffix xxx         -   a suffix to be added to names of backup files
* -confirmbigdel            -   ask about whole-replica (or path) deletes (default true)
* -confirmmerge             -   ask for confirmation before commiting results of a merge
* -contactquietly           -   suppress the 'contacting server' message during startup
* -copymax n                -   maximum number of simultaneous copyprog transfers
* -copyprog xxx             -   external program for copying large files
* -copyprogrest xxx         -   variant of copyprog for resuming partial transfers
* -copyquoterem xxx         -   add quotes to remote file name for copyprog (true/false/default)
* -copythreshold n          -   use copyprog on files bigger than this (if >=0, in Kb)
* -debug xxx                -   debug module xxx ('all' -> everything, 'verbose' -> more)
* -diff xxx                 -   set command for showing differences between files
* -dontchmod                -   when set, never use the chmod system call
* -dumbtty                  -   do not change terminal settings in text UI
* -fastcheck xxx            -   do fast update detection (true/false/default)
* -follow xxx               -   add a pattern to the follow list
* -force xxx                -   force changes from this replica to the other
* -forcepartial xxx         -   add a pattern to the forcepartial list
* -halfduplex               -   force half-duplex communication with the server
* -height n                 -   height (in lines) of main window in graphical interface
* -host xxx                 -   bind the socket to this host name in server socket mode
* -ignorearchives           -   ignore existing archive files
* -ignorecase xxx           -   identify upper/lowercase filenames (true/false/default)
* -ignoreinodenumbers       -   ignore inode number changes when detecting updates
* -ignorelocks              -   ignore locks left over from previous run (dangerous!)
* -immutable xxx            -   add a pattern to the immutable list
* -immutablenot xxx         -   add a pattern to the immutablenot list
* -key xxx                  -   define a keyboard shortcut for this profile (in some UIs)
* -killserver               -   kill server when done (even when using sockets)
* -label xxx                -   provide a descriptive string label for this profile
* -links xxx                -   allow the synchronization of symbolic links (true/false/default)
* -log                      -   record actions in logfile (default true)
* -logfile xxx              -   logfile name
* -maxbackups n             -   number of backed up versions of a file
* -maxerrors n              -   maximum number of errors before a directory transfer is aborted
* -maxthreads n             -   maximum number of simultaneous file transfers
* -merge xxx                -   add a pattern to the merge list
* -mountpoint xxx           -   abort if this path does not exist
* -nocreationpartial xxx    -   add a pattern to the nocreationpartial list
* -nodeletionpartial xxx    -   add a pattern to the nodeletionpartial list
* -noupdatepartial xxx      -   add a pattern to the noupdatepartial list
* -numericids               -   don't map uid/gid values by user/group names
* -prefer xxx               -   choose this replica's version for conflicting changes
* -preferpartial xxx        -   add a pattern to the preferpartial list
* -repeat xxx               -   synchronize repeatedly (text interface only)
* -retry n                  -   re-try failed synchronizations N times (text ui only)
* -rootalias xxx            -   register alias for canonical root names
* -rsrc xxx                 -   synchronize resource forks (true/false/default)
* -rsync                    -   activate the rsync transfer mode (default true)
* -selftest                 -   run internal tests and exit
* -servercmd xxx            -   name of unison executable on remote server
* -showarchive              -   show 'true names' (for rootalias) of roots and archive
* -socket xxx               -   act as a server on a socket
* -sortbysize               -   list changed files by size, not name
* -sortfirst xxx            -   add a pattern to the sortfirst list
* -sortlast xxx             -   add a pattern to the sortlast list
* -sortnewfirst             -   list new before changed files
* -sshargs xxx              -   other arguments (if any) for remote shell command
* -sshcmd xxx               -   path to the ssh executable
* -stream                   -   use a streaming protocol for transferring file contents (default true)
* -ui xxx                   -   select UI ('text' or 'graphic'); command-line only
* -unicode xxx              -   assume Unicode encoding in case insensitive mode
* -xferbycopying            -   optimize transfers using local copies (default true)
