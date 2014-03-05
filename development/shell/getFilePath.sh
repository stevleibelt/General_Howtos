#!/bin/bash
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2014-03-05
####

echo 'please provide file name'
read FILENAME

FILE_REALPATH=$(realpath $FILENAME);

echo 'provided filename: "'$FILENAME'"'
echo 'realpath: "'$FILE_REALPATH'"'

if [ ! -f "$FILE_REALPATH" ]; then
    echo 'file does not exist'
else
    echo 'file exist'
fi
