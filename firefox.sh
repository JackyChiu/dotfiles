#!/bin/bash

profiles=~/Library/Application\ Support/Firefox/Profiles
if ! [[ -d  $profiles ]]; then
  echo "Looks like firefox isn't installed"
  exit 1
fi

for dir in $(ls "$profiles"); do
  [[ $dir != *default ]] && exit 1
  ! [[ -d "$profiles/$dir/chrome" ]] && mkdir -p "$profiles"/"$dir"/chrome
  ln -snf "$(pwd)"/userChrome.css "$profiles/$dir/chrome"
done
