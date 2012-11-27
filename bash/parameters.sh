#!/bin/sh
#####
#
# Examples how to deal with parameters.
#
#####
# @author artodeto
# @since 2012-11-27
#####

# check is variable is null/zero
if [ -z "$1" ]; then 
  echo "\$1 is null"
fi

# check if variable is not null
if [ -n "$1" ]; then
  echo "\$1 is not null"
fi

# check if variable is not an empty string
if [ "$1" != "" ]; then
  echo "\$1 is set"
else
  echo "\$1 is not set"
fi

# check the number of given parameters
if [ "$#" -gt 0 ]; then
  echo "$# parameters are given"
else
  echo "No parameter is given"
fi
