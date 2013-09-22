#!/bin/bash
####
# Example how to get numbers from string
#
# @author stev leibelt <artodeto@arcor.de>
# @since 2013-07-08
####

STRING='What a wunderfull string this is, more the 0 words, over more the 10 characters, nice'

NUMBERS=$(echo $STRING | tr -cd [:digit:])

echo 'String: '$STRING
echo 'Numbers: '$NUMBERS
