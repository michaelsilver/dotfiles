#!/bin/bash
############################
# addfile.sh
# This adds a dotfile to the repo
############################

for arg; do
    cp ~/.$arg ./$arg
    echo $arg >> ./dotlist
    git add $arg
done
