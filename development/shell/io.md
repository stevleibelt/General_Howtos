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

## cursor movement

```
#@see: http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/x361.html
#store current cursor position
printf "\033[s"

#restore cursor position
printf "\033[u"

#erease to end of line
printf "\033[k"

#position cursor to line 4 and column 3
printf "\033[4;3H"
#or
printf "\033[4;3f"

#move the cursor up 2 lines
printf "\033[2A"

#move the cursor down 2 lines
printf "\033[2B"

#move the cursor forward 2 columns
printf "\033[2C"

#move the cursor backward 2 columns
printf "\033[2D"
```

## here doc

```
cat <<EOF
foo
bar
`pwd`
EOF
```

# input

## read

```
read 'input: ' USERINOUT
```

## select

```
select WORD in 'foo bar foobar' ; do
    $WORD
done
```

# exit codes

```
#!/bin/sh
#this will either output "Success" or "Failed"
####
# <command> && <command to execute on success> || <command to execute on failure>
cp /foo /bar && echo Success || echo Failed
```

# links

* http://www.tldp.org/LDP/abs/html/io-redirection.html
* http://steve-parker.org/sh/exitcodes.shtml
* http://unix.stackexchange.com/questions/76717/bash-launch-background-process-and-check-when-it-ends
