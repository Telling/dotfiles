# zsh config

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="minimal-fix"
COMPLETION_WAITING_DOTS="true"
DISABLE_AUTO_TITLE=true

plugins=(
    gitfast
    git-extras
    git-flow
    git_remote_branch
    git
    sudo
    brew
    osx
    aws
    mercurial
    docker
    urltools
    zsh-syntax-highlighting
    zsh-completions
    python
    pip
    virtualenvwrapper
    django
)

is_macos() {
    if [[ $(uname -s) == "Darwin" ]]; then
        return 0
    fi

    return 1
}

source $ZSH/oh-my-zsh.sh

export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:$HOME/bin:$PATH
export PATH=/usr/local/opt/python/libexec/bin:$PATH

# zsh-syntax-highlighting from brew
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# zsh-completions from brew
fpath=(/usr/local/share/zsh-completions $fpath)

rm -f ~/.zcompdump && autoload -U compinit && compinit -u

export LANG=en_US.UTF-8
export LC_MESSAGES=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# go workspace
export GOPATH=$HOME/go
export GOBIN=$HOME/go-bin
export PATH=$PATH:$GOBIN

# python workspace
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# set GPG_TTY to a real tty device
export GPG_TTY=$(tty)
# Overwrite gc to always GPG-sign commits
alias gc="git commit -v -S"

if is_macos; then; source $HOME/.zshrc_macos; fi

source $HOME/.dockeraliases
source $HOME/.zshrc_private
