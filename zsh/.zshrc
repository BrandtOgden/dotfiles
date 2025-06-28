export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="gozilla"
DISABLE_MAGIC_FUNCTIONS="true" # Pasting URLs was messed up without this
DISABLE_AUTO_TITLE="true"
DISABLE_UNTRACKED_FILES_DIRTY="true" # Says it makes git status checks faster

plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
[[ -f ~/.pathrc ]] && source ~/.pathrc
[[ -f ~/.envrc ]] && source ~/.envrc
[[ -f ~/.aliasrc ]] && source ~/.aliasrc

bindkey -v
bindkey -M viins 'jk' vi-cmd-mode
