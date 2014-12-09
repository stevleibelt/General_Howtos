# exit status

0 - ok
1 or higher - error

at the end of a script, use "exit 0" (or higher if not ok)
in a function, use "return 0" (or higher if not ok)

# variables

## assignement

MyVar='foo'

## useage

echo $MyVar

# strings

$FOO='foo'

echo $FOO'bar'  #works as expected
echo ${FOO}bar  #works also

# parameter

$#      -   number of parameters
$0      -   script name
$1-9    -   free for use

# quoting - special characters / characters for escaping

\$
\`  -   aka "backticks", usefull for executing commands like: $PWD=`pwd`
\\  -   escape
\#  -   commend
\"  -   to wrapp text with whitespaces
\'  -   like "" but without interpretion of characters like $, \ and so one

# calculation

$SUM=`expr 1+1`

# links

* http://tldp.org/LDP/abs/html/internalvariables.html
* http://mywiki.wooledge.org/BashGuide/CompoundCommands
* http://bash.cyberciti.biz/shell/academic/

## examples

* read a file line by line - http://bash.cyberciti.biz/file-management/read-a-file-line-by-line/
* write odd and even line to file - http://bash.cyberciti.biz/academic/write-odd-even-line-file/

# links

* http://stackoverflow.com/questions/3767267/check-if-file-exists
