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

  if [ -x "$(command -v jamf)" ]; then
    boldecho "Running Jamf updates"
    jamf runSoftwareUpdate
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

