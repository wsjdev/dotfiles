#!/bin/sh

if [ ! -e ~/.emacs.d ]
then
  git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
fi

if test "$(expr substr $(uname -s) 1 5)" = "Linux"
then
    if test $(which apt-get)
    then
      COMMAND='apt-get'
    elif test $(which yum)
    then
      COMMAND='yum'
    fi
  sudo ${COMMAND} install -y emacs
elif test "$(uname)" = "Darwin"
then
  brew tap d12frosted/emacs-plus
  brew install emacs-plus
  brew linkapps emacs-plus
fi
