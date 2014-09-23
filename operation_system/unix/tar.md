# compress

    tar -zcvf foo.tar.gz /path/to/foo
    (z->gzip, c->create archive, v->verbose, f->archive file name)

# uncompress

    tar -zxvf foo.tar.gz
    (x->extract)

# list content

    tar -tf foo.tar.gz

# include symbolic links

    -h, --dereference
        follow symlinks; archive and dump the files they point to

# options

* -a    --auto-compress choose compression by file suffix
*       --add-file      add a file to the archive
* -A    --concatenate   append tar files to archive
* -c    --create        create new tar archive
* -C    --directory     change to directory before perfoming any operations
* -d    --diff          calculates differences between archive and file system
* -f    --file=         define archive name 
* -r    --append        append files to the end of the archive
* -t    --list          list contents of an archive
* -u    --update        append files but only that are newer
* -x    --extract       extracts files from the archive

# links

* http://www.computerhope.com/unix/utar.htm
* http://www.linuxquestions.org/questions/linux-general-1/list-tar-contents-only-first-level-then-subdirectory-and-extract-4175512405/
* http://www.cyberciti.biz/faq/list-the-contents-of-a-tar-or-targz-file/
* http://www.pendrivelinux.com/how-to-open-a-tar-file-in-unix-or-linux/
