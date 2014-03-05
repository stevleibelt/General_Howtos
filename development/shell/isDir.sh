#!/bin/sh
########
# @author stevleibelt <artodeto@bazzline.net>
# @since 2012-11-26
########

DIR_SELF=$(cd $(dirname "$0"); pwd)

if [ -d "$DIR_SELF" ]; then
  echo "'$DIR_SELF' is a directory";
else
  echo "'$DIR_SELF' is not a directory";
  exit 1
fi

echo "listening content of directory"
ls -halt $DIR_SELF
