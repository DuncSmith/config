#!/usr/bin/env bash

config() {
	/usr/bin/git --git-dir="$HOME"/.cfg/ --work-tree="$HOME" "$@"
}

saveconfig() {
	local default_commit_msg="update"

	while getopts ":bc:" arg; do
		case $arg in
		b)
			brew bundle dump --force --file=~/Brewfile
			;;
		c)
			default_commit_msg=${OPTARG}
			;;
		\?)
			echo "Invalid option: -$OPTARG" >&2
			usage
			exit 1
			;;
		esac
	done

	config add -u
	config commit -m "$default_commit_msg"
	config push
}

usage() {
	cat <<EOF
Usage: $(basename "${BASH_SOURCE[0]}") [-b] [-c <string>]

Stage, commit and push any changes to dotfiles managed by config

Available options:

-b     Update the Brewfile
-c     Commit message, default: 'update'
EOF
}

local_devkit() {
	local devkit_path="/Users/duncansmith/dev/fac/freeagent-devkit"

	BUNDLE_GEMFILE="$devkit_path/Gemfile" bundle exec "$devkit_path/exe/devkit" "$@"
}
