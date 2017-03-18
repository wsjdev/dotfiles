#!/bin/sh

file="settings.json"
if [ "$(uname -s)" != "Darwin" ]
then
  path="$HOME/.config/Code/User/"
else
  path="$HOME/Library/Application Support/Code/User/"
fi
mkdir -p "$path"
ln -sf "$ZSH/vscode/$file" "$path$file"
