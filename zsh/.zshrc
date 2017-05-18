# zsh config

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="minimal-fix"
COMPLETION_WAITING_DOTS="true"

plugins=(
    gitfast
    git-extras
    git-flow
    git_remote_branch
    git
    sudo
    python
    django
    brew
    pip
    osx
    aws
    mercurial
    docker
    urltools
    virtualenvwrapper
    zsh-syntax-highlighting
    zsh-completions
)

is_macos() {
    if [[ $(uname -s) == "Darwin" ]]; then
        return 0
    fi

    return 1
}

source $ZSH/oh-my-zsh.sh

export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:$HOME/bin:$PATH

# zsh-syntax-highlighting from brew
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# zsh-completions from brew
fpath=(/usr/local/share/zsh-completions $fpath)

rm -f ~/.zcompdump && autoload -U compinit && compinit -u

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

export LANG=en_US.UTF-8
export LC_MESSAGES=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# go workspace
export GOPATH=$HOME/go
export GOBIN=$HOME/go-bin
export PATH=$PATH:$GOBIN

# set GPG_TTY to a real tty device
export GPG_TTY=$(tty)
# Overwrite gc to always GPG-sign commits
alias gc="git commit -v -S"

if is_macos; then; source $HOME/.zshrc_macos; fi

upgrade_gems() {
    echo "==> Updating gems"
    gem update sqlint
}

# Keep stuff up to date
update_all() {
    if is_macos; then; upgrade_brews; fi
    upgrade_gems
}

source $HOME/.dockeraliases
source $HOME/.zshrc_private
source $HOME/.iterm2_shell_integration.zsh
