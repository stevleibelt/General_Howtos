# Special Parameters

| Parameter | Definition |
| --- | --- |
| `$*` | List of arguments (as a string) |
| `$@` | List of arguments (as an array) |
| `$#` | Number of positional parameters |
| `$$` | PID of the current shell |
| `$!` | PID of the last command executed in the background |
| `$?` | Exit code of the last-executed command |
| `$0` | Path to the currently running script |
| `$-` | Current shell option flags |
| `$_` | Gives the last argument to the previous command |

[Source](https://blog.victormendonca.com/2017/09/26/bash-special-parameters/) - 20170926

# Comment

```
#this is a comment
echo "foo" #comment after a command
```

# Variables

For bash variables take a look into the [reference](https://www.gnu.org/software/bash/manual/html_node/Bash-Variables.html) section.

```
#assign
foo=bar
foobar="there is no foo without a bar"
barfoo=there\ is\ no\ bar\ without\ a\ foo
```

```
#declare
#   options
#   -r  - read only
#   -i  - integer
#   -a  - array
#   -f  - function
#   -x  - declares and export to subsequent commands via the environment
```

```
#local - variable is only available within the block of code
```

```
#read
echo "$foo"
echo "${foo}bar"
```

# Output

```
#simple line
echo "foo"

#multiple lines
echo "there
is
no
foo
without
a
bar"
```

# Link

* [tips for everyday use](https://opensource.com/article/18/5/bash-tricks) - 20190614
* [Bash: Parameter Expansion (Substitution)](https://blog.victormendonca.com/2017/09/19/bash-parameter-expansion/) - 20170919
* [Dump stack trace in a bash script with Trap](https://opensource.com/article/22/7/print-stack-trace-bash-scripts) - 20220731

