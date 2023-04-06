#!/bin/bash

# Update All The Things!!!

uatt() {
  if [[ $(uname) == 'Linux' ]]; then
    boldecho "Updating Apt"
    sudo apt update
    sudo apt upgrade -y
  fi

  if [ -x "$(command -v brew)" ]; then
    boldecho "Updating Brew"
    brew update
    brew upgrade
  fi

  if [[ -n "$(command -v asdf)" ]]; then
    boldecho "Updating asdf"
    asdf plugin-update --all
  fi
}

boldecho() {
  if [ -x "$(command -v gum)" ]; then
    gum style --bold "$1"
  else
    echo "$1"
  fi
}

