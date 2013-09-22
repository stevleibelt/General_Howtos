#!/bin/bash
########
# @author stevleibelt
# @since 2012-11-26
########

#array
#based on http://www.thegeekstuff.com/2010/06/bash-array-tutorial/
#http://wiki.bash-hackers.org/syntax/arrays
declare -a ARRAY_ENTRIES=('foo' 'bar' 'foobar');

echo "Array has "${#ARRAY_ENTRIES[@]}" elements."
echo "First entry has "${#ARRAY_ENTRIES}" characters."

for ARRAY_ENTRY in ${ARRAY_ENTRIES[@]}; do
  echo "$ARRAY_ENTRY";
done;

echo "Calling two elements, starting from second position: "${ARRAY_ENTRIES[@]:1:2}

#inarray
if [[ ${ARRAY_ENTRIES[*]} == bar ]];  then
  echo "There is a bar in the foo!"
fi

#remove first internal variable
#shift
