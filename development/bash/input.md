# get user input

```
read -p "please input something: " USER_INPUT

echo "this is your input ${USER_INPUT}"
```

# getopts

```
#opts string definition
#example "hd:bc
#
# h - option without parameter, gives errors on unsupported option
# d - option with parameter, gives errors on unsupported option
# b - option, ignores errors on unsupported option

while getopts "<opts string>" <variable name>;
do
    case $<variable name> in
        h )
            #do stuff
            ;;
        * )
            #fallback if needed
            ;;
    esac
done
```

# links

* http://stackoverflow.com/questions/16483119/example-of-how-to-use-getopts-in-bash
* http://wiki.bash-hackers.org/howto/getopts_tutorial
* http://www.tldp.org/LDP/abs/html/internal.html#GETOPTSX
* http://www.tldp.org/LDP/abs/html/extmisc.html#GETOPTY
