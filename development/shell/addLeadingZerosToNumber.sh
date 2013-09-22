#!/bin/bash
####
# Example for adding leading numbers
#
# @author stev leibelt <artodeto@arcor.de>
# @since 2013-07-10
####

# http://tldp.org/LDP/abs/html/arrays.html
# http://www.cyberciti.biz/faq/bash-for-loop-array/

NUMBERS[0]=1
NUMBERS[1]=20
NUMBERS[2]=99
NUMBERS[3]=100
NUMBERS[4]=999
NUMBERS[5]=1000

echo -e 'Number\tWith Leading Zero'
for I in "${NUMBERS[@]}"
do
    echo -e $I'\t'$(printf "%03d" $I)
done
