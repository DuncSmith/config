#!/bin/bash

# Update All The Things!!!

uatt() {
  if [[ $(uname) == 'Linux' ]]; then
    boldecho "Updating Apt"
    sudo apt update
    sudo apt upgrade -y
    sudo apt autoremove -y
  fi

  if [ -x "$(command -v brew)" ]; then
    boldecho "Updating Brew"
    brew update
    brew upgrade
    brew cleanup
  fi

  if [[ -n "$(command -v asdf)" ]]; then
    boldecho "Updating asdf"
    asdf plugin-update --all
  fi

  if [[ -n "$(command -v devkit)" ]]; then
    gum confirm --timeout 5s "Update devenv?" && devkit env update
    gum confirm --timeout 5s "Update devkit?" && devkit update --yes
  fi

  if [[ -n "$(command -v gem)" ]]; then
    boldecho "Updating Ruby-lsp gem"
    gem install ruby-lsp
  fi
}

boldecho() {
  if [ -x "$(command -v gum)" ]; then
    gum style --bold "$1"
  else
    echo "$1"
  fi
}

