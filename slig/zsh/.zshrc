##* VARIABLES ###

export PATH="$PATH:$HOME/dotfiles/slig/bin"

export MAGIC_ENTER_GIT_COMMAND=" l; gss"
export MAGIC_ENTER_OTHER_COMMAND=" l"

export VISUAL="nvim"
export EDITOR="nvim"

export MANPAGER="sh -c 'col -bx | bat -l man -p'"
# Fix Unicode in GNU Less 
export LESSUTFCHARDEF='E000-F8FF:p,F0000-FFFFD:p,100000-10FFFD:p'

# My variables
export MY_STOW_CONFIG="$HOME/dotfiles/slig/my_stow_config.json"


##* MISC ###

# /path/to/dir = cd /path/to/dir
setopt autocd
# Tab completion
autoload -Uz compinit && compinit
# Report the status of backgrounds jobs on completion 
setopt notify
# Share commands history in all session
setopt share_history
# Don't save commands that start with a space in history
setopt histignorespace
# Globs shouldn't match dotfiles
setopt noglobdots


##* PLUGINS ###

eval $(thefuck --alias)
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# Antidote plugins are listed in ~/.zsh_plugins.txt
source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
zstyle ':antidote:bundle' use-friendly-names 'yes'
antidote load


##* FINAL ###

. ~/.functions.zsh
realias

dinosay --random --color purple 'Facturusne operae pretium sim?'
