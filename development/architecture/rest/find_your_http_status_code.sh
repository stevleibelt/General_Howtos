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
    echo "Status code is: ${STATUS_CODE}"
    echo "Status message is: ${STATUS_MESSAGE}"
}

####
# @param string yes_or_no
# @param integer status_code
# @param string status_message
####
function output_status_code_and_message_if_no_was_choosen()
{
    #begin of argument mapping
    local YES_OR_NO="$1"
    #end of argument mapping

    #begin of busniess logic
    if [[ ${YES_OR_NO} == "n" ]];
    then
        STATUS_CODE="$2"
        STATUS_MESSAGE="$3"

        output_status_code_and_message
        exit 0
    fi
    #end of busniess logic
}

####
# @param string yes_or_no
# @param integer status_code
# @param string status_message
####
function output_status_code_and_message_if_yes_was_choosen()
{
    #begin of argument mapping
    local YES_OR_NO="$1"
    #end of argument mapping

    #begin of busniess logic
    if [[ ${YES_OR_NO} == "y" ]];
    then
        STATUS_CODE="$2"
        STATUS_MESSAGE="$3"

        output_status_code_and_message
        exit 0
    fi
    #end of busniess logic
}

####
# @param string question
# @param integer status_code
# @param string status_message
####
function ask_question_with_no_as_default()
{
    local QUESTION="$1"
    local STATUS_CODE="$2"
    local STATUS_MESSAGE="$3"

    read -p ":: ${QUESTION} (Y|n) " YES_OR_NO
    output_status_code_and_message_if_no_was_choosen ${YES_OR_NO} ${STATUS_CODE} ${STATUS_MESSAGE}
}

####
# @param string question
# @param integer status_code
# @param string status_message
####
function ask_question_with_yes_as_default()
{
    local QUESTION="$1"
    local STATUS_CODE="$2"
    local STATUS_MESSAGE="$3"

    read -p ":: ${QUESTION} (y|N) " YES_OR_NO
    output_status_code_and_message_if_yes_was_choosen ${YES_OR_NO} ${STATUS_CODE} ${STATUS_MESSAGE}
}

echo ":: Please answere the following questions with y (yes) or n (no)"
echo ":: The uppercased character is signaling the default value"
echo ""

ask_question_with_no_as_default "Is the endpoint available?" 503 "Service Unavailable"
ask_question_with_yes_as_default "Is the URI too long?" 414 "Request URI Too Long"

#everything seams to be fine
output_status_code_and_message
