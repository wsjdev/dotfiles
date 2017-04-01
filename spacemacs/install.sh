#!/bin/sh

brew tap d12frosted/emacs-plus
brew install emacs-plus

if test "$(uname)" = "Darwin"
then
  brew linkapps emacs-plus
fi

if [ ! -e ~/.emacs.d ]
then
  git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
fi
