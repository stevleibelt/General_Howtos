#!/bin/sh
########
# @author stevleibelt <artodeto@bazzline.net>
# @since 2012-11-26
########

FILE_SELF=$(realpath $0)

if [ -f "$FILE_SELF" ]; then
  echo "'$FILE_SELF' is a file";
else
  echo "'$FILE_SELF' is not a file";
  exit 1
fi

echo "listening file properties"
ls -halt $FILE_SELF
