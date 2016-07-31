# comment

```
#this is a comment
echo "foo" #comment after a command
```

# variables

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

# output

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
