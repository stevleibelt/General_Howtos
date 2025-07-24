# Debug a bash Script

## In the Script

```bash
#displays commands and their arguments
set -x
#displays shell inputs
set -v
#disable file name generation
set -f
#stop script on any unexpected error
set -e
#   and register error handling
#   ref: https://utcc.utoronto.ca/~cks/space/blog/programming/BashGoodSetEReports
trap 'echo "Exit status $? at line $LINENO from: $BASH_COMMAND"' ERR
```

## When calling the Script

```bash
bash -x my_function
bash -x my_script.sh
```

## Links

* http://tldp.org/LDP/Bash-Beginners-Guide/html/sect_02_03.html
* http://www.cyberciti.biz/tips/debugging-shell-script.html
* http://www.softpanorama.org/Scripting/Shellorama/bash_debugging.shtml
