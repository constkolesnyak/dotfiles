### VARIABLES ###

export MAGIC_ENTER_GIT_COMMAND=" l; git status -s"
export MAGIC_ENTER_OTHER_COMMAND=" l"

export VISUAL="nvim"
export EDITOR="nvim"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"


### MISC ###

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
# * shouldn't match dotfiles
setopt noglobdots


### PLUGINS ###

eval $(thefuck --alias)
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# Antidote: ~/.zsh_plugins.txt
source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
zstyle ':antidote:bundle' use-friendly-names 'yes'
antidote load


### FINAL ###

. ~/.functions.zsh
realias

dinosay --random --color purple 'Facturusne operae pretium sim?'
