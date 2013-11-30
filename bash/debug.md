#debug a shell script
#based on:  http://www.cyberciti.biz/tips/debugging-shell-script.html
#           http://www.softpanorama.org/Scripting/Shellorama/bash_debugging.shtml
#           http://tldp.org/LDP/Bash-Beginners-Guide/html/sect_02_03.html
## in scripts
set -x #displays commands and their arguments
set -v #displays shell inputs

## by execution

bash -x my_function
bash -x my_script.sh
