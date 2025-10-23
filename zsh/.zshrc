export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="gozilla"
DISABLE_MAGIC_FUNCTIONS="true" # Pasting URLs was messed up without this
DISABLE_AUTO_TITLE="true"
DISABLE_UNTRACKED_FILES_DIRTY="true" # Says it makes git status checks faster

plugins=(history-substring-search copypath copyfile vi-mode zsh-system-clipboard)

zstyle ':omz:lib:*' aliases no # Get rid of lib predefined aliases
source $ZSH/oh-my-zsh.sh

RPROMPT="" # Get rid of things like git diff on right side of window

# User configuration
[[ -f ~/.pathrc ]] && source ~/.pathrc
[[ -f ~/.envrc ]] && source ~/.envrc
[[ -f ~/.aliasrc ]] && source ~/.aliasrc

bindkey -v
bindkey -M viins 'jk' vi-cmd-mode

# Have j/k search through history
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# Auto-start tmux if not already inside tmux
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach 2>/dev/null || tmux
fi
