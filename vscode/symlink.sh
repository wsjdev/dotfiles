#!/bin/sh

file="settings.json"
if test "$(uname)" = "Darwin"
then
  path="$HOME/Library/Application Support/Code/User/"
else
  path="$HOME/.config/Code/User/"
fi
mkdir -p "$path"
ln -sf "$ZSH/vscode/$file" "$path$file"
