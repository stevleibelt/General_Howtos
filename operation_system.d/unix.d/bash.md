# Bash

## Reset .bashrc

```bash
cp /etc/skel/.bashrc /home/<your user>
```

## Reload .bashrc

```bash
cd ~
source .bashrc

source ~/.bashrc

bash #opens a subshell
```

## Alias

### Check if command is aliased

```bash
type -a emacs
#-bash: type: emacs: not found
alias emacs=vim
type -a emacs
#emacs is aliased to `vim'
```

### Get original / not aliased command

```bash
type -P vim
which --skip-alias vim
```

### Expand aliases

```bash
shopt -s expand_aliases
```

### Use original command / disable alias temporary

```bash
alias cd="ls -halt"
#use aliased version
cd
#use original version
\cd
#or if available
/usr/bin/ls
```

### Disable alias

```bash
alias cd="ls -halt"
unalias cd
```

## Variables

```bash
$$ = current pid
!$ = last command issued
$? = error code of last command
$0 = command
$1 = argument #1, also $2,$3,$4, etc.
@ = full command line
$_ = current shell

## Keyboard shortcuts

| Shortcut | Description |
| --- | --- |
| ctrl+a | go to the beginning of the line you are currently typing on |
| ctrl+e | go to the end of the line you are currently typing on |
| ctrl+l | clears the Screen, similar to the clear command |
| ctrl+u | clears the line before the cursor position. If you are at the end of the line, clears the entire line. |
| ctrl+h | same as backspace |
| ctrl+r | let’s you search through previously used commands |
| ctrl+c | kill whatever you are running |
| ctrl+d | exit the current shell |
| ctrl+z | puts whatever you are running into a suspended background process. fg restores it. |
| ctrl+w | delete the word before the cursor |
| ctrl+k | clear the line after the cursor |
| ctrl+t | swap the last two characters before the cursor |
| esc+t | swap the last two words before the cursor |
| alt+f | move cursor forward one word on the current line |
| alt+b | move cursor backward one word on the current line |
| tab | auto-complete files and folder names |

## history

```bash
# Show full history
history

# Search in history
CTRL + r

# Delete line in history
history -d <int: line_number>
# Persist change
history -w

# Show partial history
history <number of last entries you want to see>

# Execute command from history
!<number of the history entry>

# Execute a command relative to our position
!-2 #executes the second last command executed
!!  #executes the previous/last command
# Execute last command as root
sudo !!

# Reuse arguments from last command
!*

# Reuse last argument from last command
!$

# Execute the previous command in a subshell (recompute not re-use)
# ref: https://stackoverflow.com/a/25599486
$(!!)
# to be able to store the output into a variable
FOO=$(!!)
# or use it in a command
#   First execute the command to generate the output/find the files
find . -iname "my*.pdf" -type f
#   Secondly open the found files by calling mupdf and again doing the find
mupdf $(!!)

```

## Links

* [bash tips for everyday at the command line](https://opensource.com/article/18/5/bash-tricks) - 20180614
* [My favorit tricks for navigating the Linux terminal faster](https://opensource.com/article/22/11/navigate-linux-terminal-faster) - 20221115
* http://ss64.com/bash/
* http://www.cyberciti.biz/faq/bash-shell-temporarily-disable-an-alias/
* https://www.digitalocean.com/community/tutorials/an-introduction-to-useful-bash-aliases-and-functions
* http://www.howtogeek.com/howto/ubuntu/keyboard-shortcuts-for-bash-command-shell-for-ubuntu-debian-suse-redhat-linux-etc/
* http://tldp.org/HOWTO/Bash-Prog-Intro-HOWTO-3.html
* https://opensource.com/article/17/7/bash-prompt-tips-and-tricks
* https://www.digitalocean.com/community/tutorials/how-to-use-bash-history-commands-and-expansions-on-a-linux-vps

