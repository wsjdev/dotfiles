#!/bin/bash -eu

FILE_PATH="${HOME}/.config/nvim"
FILE_NAME="init.vim"

mkdir -p ${FILE_PATH}
ln -sf "${ZSH}/neovim/init.vim" "${FILE_PATH}/${FILE_NAME}"
