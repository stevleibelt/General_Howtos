#!/bin/bash

echo 'current directory'
pwd

if [ "$1" != '' ]; then
    cd $1
else
    cd ..
fi

echo 'new directory'
pwd

echo 'Usage: '$(basename $0)' [<path to change>]'
