case ${OSTYPE} in
  darwin*)
    # Mac用の設定
    export CLICOLOR=1
    alias ls='ls -G -F'
    ;;
  linux*)
    # Linux用の設定
    alias ls='ls -F --color=auto'
    ;;
esac
alias l="ls -lAh"
alias ll="ls -l"
alias la='ls -A'
