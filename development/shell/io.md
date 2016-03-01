# general

Also take a look to '<repository root>/development/bash/colors.md'.

# output

## echo

take a look at 'repository_root/unix/echo.md'.

## printf

take a look at 'repository_root/unix/printf.md'.

## tput

tput is usefull to get and set terminal attributes.

### options

* clear     -   clears screen
* cup y x   -   set cursor to position y/x
* cols      -   get number of columns
* lines     -   get number of lines
* it        -   get number of ident tab
* el        -   deletes content of current line starting at current cursor position
* bold      -   switches output to bold
* sgr0      -   reset output
* rev       -   output reverse (background color becomes foreground and vice versa)
* colors    -   returns number of supported colors
* setaf <i> -   sets foreground color
* setab <i> -   sets background color

## colors

### get a list of all available colors

```
echo $LS_COLORS 
```

### list of default colors

* 0 -   black
* 1 -   red
* 2 -   green
* 3 -   orange/yellow
* 4 -   blue
* 5 -   lila
* 6 -   light blue
* 7 -   grey

### example

```
tput setaf 2 #set foreground color to green
echo 'this is a text'
tput sgr0    #reset foreground color
```

## here doc

    cat <<EOF
    foo
    bar
    `pwd`
    EOF

# input

## read

    read 'input: ' USERINOUT

## select

    select WORD in 'foo bar foobar' ; do
        $WORD
    done

# links

* http://www.tldp.org/LDP/abs/html/io-redirection.html
