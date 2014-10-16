# revert all

    svn revert -R .

# revert via script

    svn st -q | awk '{print $2;}' | xargs svn revert

# revert commit
## importent is the "-" before the $revisionNumber

svn merge -c -<revison name> .
