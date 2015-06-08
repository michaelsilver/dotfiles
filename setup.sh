#!/bin/bash
############################
# setup.sh
# This script creates symlinks from the home directory to dotfiles specified in dotlist
############################

olddir=~/dotfiles_old             # old dotfiles backup directory

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"


createsymlinks () {
    echo "Moving pre-existing .$1 from ~ to $olddir for safekeeping"
    mv ~/.$1 ~/dotfiles_old/
    echo "Creating symlink from git-controlled $1 to home directory."
    ln -s ./$1 ~/.$1
}

# either use all listed in dotlist, or specified in arg list
if [ $# -eq 0 ];
then
    while read name
    do
	createsymlinks "$name"
    done < ./dotlist
else
    for arg; do
	createsymlinks "$arg"
    done
fi
