#!/bin/bash
####
# Example for using ls
#
# @author stev leibelt <artodeto@arcor.de>
# @since 2013-07.09
####

PATTERN='ls'
PATH=$(ls $PATTERN*)

echo 'Pattern '$PATTERN
echo 'Path '$PATH
