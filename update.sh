#!/bin/bash

set -x
set -e

rm -f 00-index.tar.gz
wget http://hackage.haskell.org/packages/archive/00-index.tar.gz
tar xf 00-index.tar.gz
rm -f 00-index.tar.gz

if [ -n "$(git status --porcelain)" ]
then
    git add -A
    git commit -m "Update from Hackage at $(date)"
    git push git@github.com:commercialhaskell/all-cabal-files.git HEAD:master
else
    echo No changes present
fi
