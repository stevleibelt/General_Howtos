#!/bin/bash
####
# subshells are not polluting the main shell "variable space" since they only exists in the subshell
# subshells inherit the environment from the parent
#
# links: http://mywiki.wooledge.org/SubShell
# @author stev leibelt <artodeto@bazzline.net>
# @since 2014-03-11
####

FOO='bar'
echo 'foo: '$FOO
echo 'current working directory'
pwd

echo

({
    echo 'entering subshell'
    cd ../
    FOO='foo'
    echo 'foo: '$FOO
    echo 'current working directory'
    pwd
    echo 'leaving subshell'
})

echo
echo 'foo: '$FOO
echo 'current working directory'
pwd
