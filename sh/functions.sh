#!/bin/sh
#####
#
# Example functions.
#
#####
# @author artodeto
# @since 2012-11-29
#####

##
#Updating a bunch of svn repositories
##
function svnUpdateAll()
{
  DIRECTORIES=( trunk branch branch2 branch3 rc release )
  DIR_BASE=$HOME"my/basepath/to/all/repositories"

  for DIRECTORY in ${DIRECTORIES[@]}
  do
    cd $DIR_BASE"/"$DIRECTORY
    pwd
    svn update 
  done
}

##
#Merging from $scope[/$target]
##
function svnMergeFrom()
{
  URL_BASE="https://svn.mydomain.de/myproject"

  if [ "$1" == "branch" ]; then
    if [ -n "$2" ]; then
      URL=$URL_BASE"/branches/"$2
    else
      echo "Target required for scope '$1'"
      exit 1
    fi
  elif [ "$1" == "release" ]; then
    if [ -n "$2" ]; then
      URL=$URL_BASE"/releases/"$2
    else
      echo "Target required for scope '$1'"
      exit 1
    fi
  elif [ "$1" == "trunk" ]; then
    URL=$URL_BASE"/trunk"
  else
    echo "Help"
    echo "Call with [scope] [target]. Scope can be [help|trunk|branch|release]. Target must be an available branch or release"
    exit 1
  fi

  svn merge "$URL" .
}

##
#ssh login to test
#
#since we are using a name, your hosts file should have an entry for that
##
function sshMyTestHost()
{
  case "$1" in
   "root") USER="root";;
   "guest") USER="guest";;
   *) USER="user"
  esac

  ssh $USER@myTestHost
}

