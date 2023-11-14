# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.aliases.zsh ] && source ~/.aliases.zsh
[ -f ~/bin/uatt.sh ] && source ~/bin/uatt.sh
[ -f ~/bin/config-mgmt.sh ] && source ~/bin/config-mgmt.sh

source "$(brew --prefix asdf)/libexec/asdf.sh"

export VISUAL=/usr/local/bin/nvim
export EDITOR="$VISUAL"

export AWS_VAULT_KEYCHAIN_NAME=login
export AWS_VAULT_PROMPT=osascript
export AWS_SDK_LOAD_CONFIG=1

# bind Home and End keys
bindkey '\e[H'    beginning-of-line
bindkey '\e[F'    end-of-line

## History command configuration
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
[ "$HISTSIZE" -lt 50000 ] && HISTSIZE=50000
[ "$SAVEHIST" -lt 10000 ] && SAVEHIST=10000

HISTCONTROL=erasedups:ignorespace
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt HIST_SAVE_NO_DUPS     # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS    # Remove superfluous blanks before recording entry.
setopt HIST_IGNORE_ALL_DUPS  # Delete old recorded entry if new entry is a duplicate.
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data

# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)
autoload -Uz compinit && compinit

# eval "$(starship init zsh)"
# eval "$(direnv hook zsh)"
source ~/powerlevel10k/powerlevel10k.zsh-theme
# source "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/zshrc"

export GITHUB_TOKEN=$(gh auth token)
export GITHUB_OAUTH_TOKEN=$(gh auth token)

# Source automated FreeAgent shell config
source /Users/duncansmith/.freeagent_shell_profile

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/duncansmith/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
