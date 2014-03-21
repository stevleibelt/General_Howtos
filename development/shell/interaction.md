# input / output redirection

## basics

0   -   stdin / standard input
1   -   stdout / standard output
2   -   stderr / standard error

## twist

    ls -l > foo.bar # stdout redirection of `ls -l` into file 'foo.bar'

    ls -l foo 2>/dev/null   # stderr redirection - prevent error message "ls: cannot access foo: No such file or directory"

    ls -l foo 2>&1  # stderr redirection - redirect stderr to stdout

    ls -l foo >/dev/null 2>&1  # redirection of stderr to stdout and stdout with stderr to /dev/null ("1>" the 1 is optional, if not exists, stdout is taken as default)

    ls -l foo 2>&1 >/dev/null   # redirection of stderr to stdout and stdout to /dev/null (stderr gets displayed on the screen!)

    wc -c < /dev/null   # stdint redirection - redirect content of a file to word cound


