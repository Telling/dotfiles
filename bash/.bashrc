# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
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
if [ -f "${HOME}/.bash_aliases" ]; then
  . "${HOME}/.bash_aliases"
fi

complete -C '/usr/local/bin/terraform' terraform
complete -C '/usr/local/bin/aws_completer' aws

# enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Save and reload the history after each command finishes
#PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

parse_git_stash() {
  [[ $(git stash list 2>/dev/null | tail -n1) != "" ]] && echo ":stash"
}

parse_git_branch() {
  git branch 2>/dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ (\1$(parse_git_stash))/"
}

parse_background_jobs() {
  bg_jobs=$(jobs -p) && [[ "${bg_jobs}" != "" ]] && echo " {$(echo "${bg_jobs}" | wc -l)}"
}

export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$(parse_git_branch)\[\033[00m\]\$(__docker_machine_ps1)\$(parse_background_jobs)\$ "

# Docker helper functions
if [ -f "${HOME}/.docker_functions" ]; then
  . "${HOME}/.docker_functions"
fi

# Functions to make everyday living a joy
if [ -f "${HOME}/.bash_functions" ]; then
  . "${HOME}/.bash_functions"
fi

# Secrets for my environment
secrets=$(find ~/.*_secrets -type f)
if [ -n "${secrets}" ]; then
  for f in ${secrets}; do
    source "${f}"
  done
fi

. "$HOME/.local/bin/env"
eval "$(uv generate-shell-completion bash)"
eval "$(uvx --generate-shell-completion bash)"

export PATH="${HOME}/.local/usr/bin:$PATH"

export EDITOR=nvim

alias claude="${HOME}/.claude/local/claude"
