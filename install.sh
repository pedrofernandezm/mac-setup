#!/bin/bash

set -e

function __echo {
  echo "<><><><><><><><><><><><><><><><><><><><><><><>"
  echo ">> $1"
  echo "<><><><><><><><><><><><><><><><><><><><><><><>"
}

function __brew_install {
  local item=$1
  __echo "Installing $item"
  brew install $item
}

__echo "Installing Homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

declare -a install_items=(
                "zsh"
                "git"
                "vim"
                "tmux"
                "python"
                "python3"
                "autojump"
                "ctags"
                "openssl"
                "reattach-to-user-namespace"
                "heroku-toolbelt"
                "imagemagick"
                "qt"
                "node"
                "postgres"
                "redis"
                "ag"
                "zsh-syntax-highlighting"
              )

for item in "${install_items[@]}"
do
  __brew_install $item
done

__echo "Installing tmuxp"
pip3 install tmuxp

__echo "Installing Oh My Zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
