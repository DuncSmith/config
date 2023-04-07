#!/usr/bin/env bash
#
git clone --bare https://github.com/DuncSmith/config.git "$HOME"/.cfg

function config {
   /usr/bin/git --git-dir="$HOME"/.cfg/ --work-tree="$HOME" $@
}

mkdir -p .config-backup
if config checkout; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | xargs -n1 dirname | uniq | grep -E "[^.]" | xargs -I{} mkdir -p ~/.config-backup/{}
    config checkout 2>&1 | grep -E "^\s+" | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no

