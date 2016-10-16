#!/bin/bash
####
# @author stev leibelt <artodeto@bazzline.net>
# @since 2016-09-13
# @see http://i.stack.imgur.com/whhD1.png
####

STATUS_CODE=200
STATUS_MESSAGE="OK"

function output_status_code_and_message()
{
    echo ""
    echo ":: Status code is: ${STATUS_CODE}"
    echo ":: Status message is: ${STATUS_MESSAGE}"
}

echo ":: Please answere the following questions with y (yes) or n (no) (n is always default)."
echo ""

read -p ":: Is the endpoint available? " YES_OR_NO

if [[ ${YES_OR_NO} == "n" ]];
then
    STATUS_CODE=503
    STATUS_MESSAGE="Service Unavailable"

    output_status_code_and_message
    exit 0
fi
