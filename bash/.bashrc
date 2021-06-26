# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth:ignoredups:erasedups

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=100000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

complete -C /home/st/.local/bin/terraform terraform

# Save and reload the history after each command finishes
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Java configuration
export JAVA_HOME="/usr/lib/jvm/java-15-openjdk-amd64/"

# Python configuration
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/liva
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=$HOME/.local/bin/virtualenv
source $HOME/.local/bin/virtualenvwrapper.sh

parse_git_stash() {
  [[ $(git stash list 2> /dev/null | tail -n1) != "" ]] && echo ":stash"
}

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ (\1$(parse_git_stash))/"
}
export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$(parse_git_branch)\[\033[00m\]\$(__docker_machine_ps1)\$ "

# Docker helper functions
if [ -f ~/.docker_functions ]; then
    . "${HOME}/.docker_functions"
fi

# Functions to make everyday living a joy
if [ -f ~/.bash_functions ]; then
    . "${HOME}/.bash_functions"
fi

# Secrets for my environment
if [ -f ~/.env_secrets ]; then
    . "${HOME}/.env_secrets"
fi
