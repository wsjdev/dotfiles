#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

# Check for Homebrew
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."

  # Install the correct homebrew for each OS type
  if test "$(uname)" = "Darwin"
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  elif test "$(expr substr $(uname -s) 1 5)" = "Linux"
  then
    if test $(which apt-get)
    then
      command='apt-get'
      sudo apt-get install -y build-essential
    elif test $(which yum)
    then
      command='yum'
      sudo yum groupinstall -y 'Development Tools'
    fi

    sudo $command install -y ruby
    sudo $command install -y curl

    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
  fi
fi

exit 0
