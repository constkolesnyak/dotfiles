##* VARIABLES ###

export PATH="$PATH:$HOME/dotfiles/bin"

export MAGIC_ENTER_GIT_COMMAND=" l; gss"
export MAGIC_ENTER_OTHER_COMMAND=" l"

export VISUAL="nvim"
export EDITOR="nvim"

export MANPAGER="sh -c 'col -bx | bat -l man -p'"
# Fix Unicode in GNU Less 
export LESSUTFCHARDEF='E000-F8FF:p,F0000-FFFFD:p,100000-10FFFD:p'

export POETRY_VIRTUALENVS_IN_PROJECT=true
export POETRY_VIRTUALENVS_OPTIONS_NO_SETUPTOOLS=true
export POETRY_VIRTUALENVS_OPTIONS_NO_PIP=true
export POETRY_VIRTUALENVS_PROMPT="{project_name}"


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

# shellcheck source=/dev/null
. ~/.functions.zsh
realias

dinosay --random --color purple 'Facturusne operae pretium sim?'
