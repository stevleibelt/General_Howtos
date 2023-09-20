#debug a shell script

## in the script

```bash
#displays commands and their arguments
set -x
#displays shell inputs
set -v
#disable file name generation
set -f
```

## when calling the script

```bash
bash -x my_function
bash -x my_script.sh
```

# links

* http://tldp.org/LDP/Bash-Beginners-Guide/html/sect_02_03.html
* http://www.cyberciti.biz/tips/debugging-shell-script.html
* http://www.softpanorama.org/Scripting/Shellorama/bash_debugging.shtml
