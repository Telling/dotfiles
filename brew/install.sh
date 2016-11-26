#!/usr/bin/env bash

if ! which brew > /dev/null; then
    echo "Brew not in \$PATH."
    read -rp "Do you wish to install brew? [yN] " answer
    case "$answer" in
        [Yy]) /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";;
        [Nn]) echo "Not installing brew"; exit 1;;
           *) echo "Bad input"; exit 2;;
    esac
fi

if [ "$1" = "formulaes" ] || [ "$1" = "casks" ]; then
    tr '\n' '\0' < "${PWD}/${1}" | xargs -0 brew install
    exit 0
fi

echo 'Either formulaes or casks required as argument.'
exit 2
