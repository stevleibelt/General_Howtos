#!/bin/bash
########
# Creates a git repository on a simple git server.
#   Suffix >>.git<< will be added automatically.
#   It is assumed that:
#       The root path to all repositories is >>/srv/git<<
#       That the user >>git<< exists
#       That the group >>git<< exists
####
# @since 2020-11-09
# @author stev leibelt <artodeto@bazzline.net
########

if [[ whoami -ne "root" ]];
then
    echo ":: Skript must be executed by root."
fi

if [[ $# -lt 1 ]];
then
    echo ":: Invalid arguments provided."
    echo "   <command> \"<name_of_the_git_repository>\""

    exit 1;
fi

ROOT_PATH_TO_THE_GIT_SERVER="/srv/git"
PATH_TO_THE_REPOSITORY="${1}"

FULL_PATH_TO_THE_REPOSITORY="${ROOT_PATH_TO_THE_GIT_SERVER}/${PATH_TO_THE_REPOSITORY}.git"

if [[ ! -d "${ROOT_PATH_TO_THE_GIT_SERVER}" ]];
then
    mkdir -p "${ROOT_PATH_TO_THE_GIT_SERVER}"
fi

if [[ ! -d "${FULL_PATH_TO_THE_REPOSITORY}" ]];
then
    mkdir -p "${FULL_PATH_TO_THE_REPOSITORY}"
    cd "${FULL_PATH_TO_THE_REPOSITORY}"
    git init --bare
    cd -
else
    echo ":: Repository path exists already."
    echo "   >>${FULL_PATH_TO_THE_REPOSITORY}"
    echo "   Check yourself if you need to initialize the repository with >>git init --bar<<."
fi

chown -R git:git "${ROOT_PATH_TO_THE_GIT_SERVER}"

HOSTNAME=$(hostname)
echo ":: Use one of the following commands to interact with your repository."
echo "   git remote add origin ${HOSTNAME}:${FULL_PATH_TO_THE_REPOSITORY}"
echo "   git remote set-url origin ${HOSTNAME}:${FULL_PATH_TO_THE_REPOSITORY}"
echo "   git clone ${HOSTNAME}:${FULL_PATH_TO_THE_REPOSITORY}"
