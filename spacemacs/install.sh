#!/bin/sh

if [ ! -e ~/.emacs.d ]
then
  git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
fi
