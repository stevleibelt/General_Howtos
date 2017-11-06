#!/bin/bash
####
# @link https://artodeto.bazzline.net/archives/19519-Migrate-all-branches-and-tags-to-bitbucketgithubgitlabother-remote-endpoint.html
# @since 2017-11-06
# @author stev leibelt <artodeto@bazzline.net>
####

if [[ $# -lt 2 ]];
then
    echo ":: Invalid arguments provided."
    echo "   <command> \"<source repository url>\" \"<destination repository url>\""

    exit 1;
fi

DESTINATION_REPOSITORY_PATH="${2}"
SOURCE_REPOSITORY_PATH="${1}"
TEMPORARY_DIRECTORY="migrate_git_branch"

echo ":: Creating temporary directory."
mkdir "${TEMPORARY_DIRECTORY}"

cd "${TEMPORARY_DIRECTORY}"

echo ":: Cloning from source repository.".
git clone --mirror "${SOURCE_REPOSITORY_PATH}" .

echo ":: Pushing to destination repository."
git push --mirror "${DESTINATION_REPOSITORY_PATH}"

echo ":: You have to remove the following temporary directory if you want to."
echo "   "$(pwd)
