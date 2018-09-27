#!/bin/bash

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DOTFILES=$BASEDIR/files

echo "homepath = $HOME"
echo "basedir = $BASEDIR"
echo "dotfiles = $DOTFILES"

cd $DOTFILES

echo "-> create missing directories"
find -type d -exec mkdir -p -v -- "$HOME"/{} \;

linkFiles=`find -type f -print | cut -c3-`

echo "-> linking files"
for i in $linkFiles; do
  ln -s -v -i $DOTFILES/$i $HOME/$i
done
