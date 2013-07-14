#!/bin/bash

# Finds "include" directories and generates set path commands for each of them.
# These should be added to .local.vimrc of your current project. You can then
# easily navigate to all the header files in your project
#
# Invoke it like this:
# . ~/vimrc/utilities/findincludes.sh > .local.vimrc

PWD=`pwd`
INCLUDE_DIRS=`find . -name "include" -type d` 

for INCLUDE_PATH in $INCLUDE_DIRS
do
  echo "set path+=$PWD${INCLUDE_PATH:1}"
done
