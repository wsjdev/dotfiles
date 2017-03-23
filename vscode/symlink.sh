#!/bin/sh

file="settings.json"
if [ "$(uname -s)" == "Darwin" ]
then
  path="$HOME/Library/Application Support/Code/User/"
else
  path="$HOME/.config/Code/User/"
fi
mkdir -p "$path"
ln -sf "$ZSH/vscode/$file" "$path$file"
