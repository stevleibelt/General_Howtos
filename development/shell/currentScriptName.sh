#!/bin/bash
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2014-03-05
####

CURRENT_SCRIPT_PWD="$0"
CURRENT_SCRIPT_NAME=$(basename $0)
CURRENT_SCRIPT_REALPATH_WITH_SCRIPTNAME=$(realpath $0)
CURRENT_SCRIPT_REALPATH=$(dirname $CURRENT_SCRIPT_REALPATH_WITH_SCRIPTNAME)

echo 'current script name: '$CURRENT_SCRIPT_NAME
echo 'current script working directory: '$CURRENT_SCRIPT_PWD
#realpath needed
echo 'current script real path with script name: '$CURRENT_SCRIPT_REALPATH_WITH_SCRIPTNAME
echo 'current script real path: '$CURRENT_SCRIPT_REALPATH
