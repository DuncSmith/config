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

	if [[ -n "$(command -v mise)" ]]; then
		boldecho "Updating mise"
		mise self-update -y
	fi

	if [[ -n "$(command -v devkit)" ]]; then
		gum confirm --timeout 5s "Update devkit?" && devkit update --yes
		gum confirm --timeout 5s "Update devenv?" && devkit env update
	fi

	if [[ -n "$(command -v gem)" ]]; then
		boldecho "Updating Ruby-lsp gem"
		gem install ruby-lsp
	fi

	if [[ -n "$(command -v gh)" ]]; then
		boldecho "Updating gh extensions"
		gh extension upgrade --all
	fi
}

boldecho() {
	if [ -x "$(command -v gum)" ]; then
		gum style --bold "$1"
	else
		echo "$1"
	fi
}
