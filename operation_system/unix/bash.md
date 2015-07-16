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

# links

* http://ss64.com/bash/
* http://www.cyberciti.biz/faq/bash-shell-temporarily-disable-an-alias/
* https://www.digitalocean.com/community/tutorials/an-introduction-to-useful-bash-aliases-and-functions
