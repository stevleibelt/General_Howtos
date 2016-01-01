# reset .bashrc

    cp /etc/skel/.bashrc /home/<your user>

# reload .bashrc

    cd ~
    source .bashrc

    source ~/.bashrc

    bash #opens a subshell

# alias

## check if command is aliased

    type -a emacs
    #-bash: type: emacs: not found
    alias emacs=vim
    type -a emacs
    #emacs is aliased to `vim'

## get original / not aliased command

    type -P vim
    which --skip-alias vim

## expand aliases

    shopt -s expand_aliases

## us original command / disable alias temporary

    alias cd="ls -halt"
    #use aliased version
    cd
    #use original version
    \cd
    #or if available
    /usr/bin/ls

## disable alias

    alias cd="ls -halt"
    unalias cd

## variables

```
$$ = current pid
!$ = last command issued
$? = error code of last command
$0 = command
$1 = argument #1, also $2,$3,$4, etc.
@ = full command line
$_ = current shell

# keyboard shortcuts

* ctrl + a  -   go to the beginning of the line you are currently typing on
* ctrl + e  -   go to the end of the line you are currently typing on
* ctrl + l  -   clears the Screen, similar to the clear command
* ctrl + u  -   clears the line before the cursor position. If you are at the end of the line, clears the entire line.
* ctrl + h  -   same as backspace
* ctrl + r  -   let’s you search through previously used commands
* ctrl + c  -   kill whatever you are running
* ctrl + d  -   exit the current shell
* ctrl + z  -   puts whatever you are running into a suspended background process. fg restores it.
* ctrl + w  -   delete the word before the cursor
* ctrl + k  -   clear the line after the cursor
* ctrl + t  -   swap the last two characters before the cursor
* esc + t   -   swap the last two words before the cursor
* alt + f   -   move cursor forward one word on the current line
* alt + b   -   move cursor backward one word on the current line
* tab       -   auto-complete files and folder names
```

# links

* http://ss64.com/bash/
* http://www.cyberciti.biz/faq/bash-shell-temporarily-disable-an-alias/
* https://www.digitalocean.com/community/tutorials/an-introduction-to-useful-bash-aliases-and-functions
* http://www.howtogeek.com/howto/ubuntu/keyboard-shortcuts-for-bash-command-shell-for-ubuntu-debian-suse-redhat-linux-etc/
* http://tldp.org/HOWTO/Bash-Prog-Intro-HOWTO-3.html
