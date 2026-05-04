#!/bin/bash

camelize() {
  read phrases
  echo -e "$phrases" | perl -pe 's/\b(.)/\u\1/g' | sed 's/ //g'
}

switch-branch() {
  git branch | cut -c 3- | hs | xargs git checkout
}

checkout-branch() {
  if [ -z "$1" ] || git remote | grep -q $1; then
    branch=${1:-origin}
    git branch -r | grep "$branch/" | cut -d'/' -f 2- | hs | xargs -I{} git checkout -b '{}' $branch/'{}'
  else
    git checkout -b "$1" origin/"$1"
  fi
}

p() { cd $(find ~/dev/* ~/repos -type d -maxdepth 1 | hs); }

