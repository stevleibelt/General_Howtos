#!/bin/bash

if [[ $# -lt 2 ]];
then
    echo ":: Invalid arguments provided."
    echo "   <command> \"<source repository url>\" \"<destination repository url>\" \"[<path to the repository>]\""

    exit 1;
fi

if [[ $# -gt 2 ]];
then
    PATH_TO_THE_REPOSITORY="${3}"
else
    PATH_TO_THE_REPOSITORY=$(pwd)
fi

DESTINATION_REPOSITORY_PATH="${2}"
SOURCE_REPOSITORY_PATH="${1}"

PATH_TO_THE_GIT_CONFIG_FILE="${PATH_TO_THE_REPOSITORY}/.git/config"
PATH_TO_THE_GIT_BACKUP_CONFIG_FILE="${PATH_TO_THE_GIT_CONFIG_FILE}.original"

if [[ ! -f "${PATH_TO_THE_GIT_CONFIG_FILE}" ]];
then
    echo ":: No git configuration file available."
    echo "   Check why \"${PATH_TO_THE_GIT_CONFIG_FILE}\" is not a file."

    exit 2;
fi

echo ":: Creating backup of the git configuration file."
cp "${PATH_TO_THE_GIT_CONFIG_FILE}" "${PATH_TO_THE_GIT_BACKUP_CONFIG_FILE}"

echo ":: Adapting git configuration file."
#sed -i -e 's/"${SOURCE_REPOSITORY_PATH}"/"${DESTINATION_REPOSITORY_PATH}"/g' "${PATH_TO_THE_GIT_CONFIG_FILE}"
sed -i "s%${SOURCE_REPOSITORY_PATH}%${DESTINATION_REPOSITORY_PATH}%g" "${PATH_TO_THE_GIT_CONFIG_FILE}"
