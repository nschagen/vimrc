#!/bin/bash

# Checks whether the current dir is correct
# (Must be the dir where this script and the other files are located)

if [ -d ".git" ]; then 

	# Copies this directory to ~/.vim and then moves .vimrc to ~
	if [ ! -d ~/.vim ];  then
	  mkdir ~/.vim
	fi

  # Initialize new submodules and merge any pulled changes into others
  git submodule update --init --merge

	cp -r * ~/.vim 2>/dev/null # Copy and Ignore complaints about being unable to copy parts of .git directories
	cp .vimrc ~/.vimrc 
else
	echo "Script must be run inside it's own directory" 1>&2
fi
