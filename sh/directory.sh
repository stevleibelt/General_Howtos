#!/bin/bash
########
# Script to show simple dealing with directories.
#
# @author stev leibelt
# @since 2013-02-02
########

#directory exists
if [[ -d '/home' ]]; then
  echo 'Directory /home exists';
fi

if [[ ! -d '/homie' ]]; then
  echo 'Diretory /homie does not exists';
fi
