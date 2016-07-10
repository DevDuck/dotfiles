#!/bin/bash

# Script to automatically create GitHub pull.
# Author: Rich
#
# USAGE:
# pull                     - Create pull from current branch in head fork to base fork.
# pull <branch>            - Create pull from <branch> in head fork to base fork.
# pull <branch> .          - Create pull from current branch in head fork to <branch> in base fork.
# pull <branch1> <branch2> - Create pull from <branch2> in head fork to <branch1> in base fork.
#
# Other shortcuts:
# pull a - Create pull from API to API.
# pull b - Create pull from beta to master.
# pull e - Create pull from epsilon to master.

repo=mobilligy
headfork=DevDuck
basefork=main

headbranch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')

if [ "$1" == "" ]; then
    basebranch=$headbranch
elif [ "$2" == "." ]; then
    basebranch=$1
elif [ "$2" != "" ]; then
    headbranch=$2
    basebranch=$1
elif [ "$1" == "b" ]; then
    headbranch=beta
    basebranch=master
elif [ "$1" == "e" ]; then
    headbranch=epsilon
    basebranch=master
elif [ "$1" == "a" ]; then
    headbranch=api
    basebranch=api
else
    headbranch=$1
    basebranch=$1
fi

open "https://github.com/$repo/$basefork/compare/$basebranch...$headfork:$headbranch"
