if test "$(uname)" = "Darwin"
then
elif test "$(expr substr $(uname -s) 1 5)" = "Linux"
then
  export PATH="$HOME/.linuxbrew/bin:$PATH"
  export PATH="$HOME/.linuxbrew/sbin:$PATH"
  export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
  export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
  export XDG_DATA_DIRS="$HOME/.linuxbrew/share:$XDG_DATA_DIRS"
fi
