#!/bin/sh

file="settings.json"
path="$HOME/.config/Code/User/"
mkdir -p $path
ln -s "$ZSH/vscode/$file" "$path$file"
