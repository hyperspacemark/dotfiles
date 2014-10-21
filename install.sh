#!/usr/bin/env bash

files=(aliases gemrc gitconfig gitignore hushlogin lldbinit vimrc zshrc)

for file in ${files[@]}; do
  new_path="$HOME/.$file"
  if [[ ! -f $new_path && ! -d $new_path ]]; then
    ln -s $PWD/$file $new_path
    echo "Linking $PWD/$file to $new_path"
  fi
done
