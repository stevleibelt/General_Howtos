#!/bin/sh
########
# @author stevleibelt
# @since 2013-01-15
########

echo 'Enter something'
read VALUE

if [ `expr $VALUE + 1 2> /dev/null` ]; then
  echo $VALUE' is numeric';
else 
  echo $VALUE' is not numeric';
fi
