#!/bin/bash
case $- in
    *i*) ;;
      *) return;;
esac

HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

shopt -s histappend
shopt -s checkwinsize
shopt -s globstar
shopt -s autocd

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
. "$HOME/.cargo/env"

alias ll='ls -lah'
alias l='ls -CF'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias gs='git status'
alias gd='git diff'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

my_prompt() {
  local RED="\e[31m"
  local GREEN="\e[32m"
  local YELLOW="\e[33m"
  local MAGENTA="\e[35m"
  local CYAN="\e[36m"
  local NOCOLOR="\e[0m"

  local ERR_CODE=""
  if [[ $1 != 0 ]]; then
    ERR_CODE=" : $RED$1$NOCOLOR"
  fi

  local GIT_PROMPT=$(__git_ps1 '(%s)')
  if [[ -n "$GIT_PROMPT" ]]; then
    GIT_PROMPT=" $GREEN$GIT_PROMPT$NOCOLOR"
  fi

  IFS='[;' read -rsd R -p $'\e[6n' _ _ COL
  if [[ "$COL" != 1 ]]; then
    echo "\[\033[30;47m\]%\[\033[0m\]"
  fi

  printf "%0.s " $(seq 1 $(($(tput cols) - 10)))
  echo -e "$CYAN[$(date +'%R:%S')]\r$MAGENTA[\w]$GIT_PROMPT$NOCOLOR$ERR_CODE"
  echo "$YELLOWλ$NOCOLOR "
}
export PROMPT_DIRTRIM=7
export PROMPT_COMMAND='export PS1=$(my_prompt $?)'

bind -r '\C-s'
stty -ixon

bind 'set completion-ignore-case on'
