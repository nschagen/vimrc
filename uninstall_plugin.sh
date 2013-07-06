#!/bin/sh

if [ $# -eq 0 ]; then
  echo "please specify the name of a plugin!" >&2
  exit
fi

if [ -d ".git" ]; then
  #Uninstall all given plugins
  while [ "$1" != "" ]; do
    plugin=$1

    if [ -d "bundle/$plugin" ]; then
      echo "Uninstalling plugin $plugin"
      echo "git submodule deinit bundle/$plugin"
      #TODO: remove it from .gitmodules!!!
      echo "git rm --cached bundle/$plugin"
      echo "rmdir bundle/$plugin"
    else
      echo "Plugin $plugin does not exists. Skipping!"
    fi
    shift
  done
else
  echo "You're not in the top level directory!"
fi
