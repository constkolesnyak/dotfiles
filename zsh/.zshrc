##* SOURCE FUNCTIONS AND ENV VARS ###

refunc() {
    for file in ~/.*functions.zsh; do
        # shellcheck source=/dev/null
        . "$file"
    done
}

refunc
reenv

##* MISC ###

# /path/to/dir = cd /path/to/dir
setopt autocd
# Report the status of backgrounds jobs on completion
setopt notify
# Share commands history in all session
setopt share_history
# Don't save commands that start with a space in history
setopt histignorespace
# Globs shouldn't match dotfiles
setopt noglobdots

##* TAB COMPLETION ###

# Brew
if type brew &>/dev/null; then
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

autoload -Uz compinit && compinit

##* PLUGINS ###

eval "$(thefuck --alias)"
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# Antidote loads plugins listed in ~/.zsh_plugins.txt
source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
zstyle ':antidote:bundle' use-friendly-names 'yes'
antidote load

##* FINAL ###

realias

dinosay --random --color purple 'Facturusne operae pretium sim?'
