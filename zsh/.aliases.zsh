##* DOTFILES ###

alias reload='. ~/.zshrc'
alias refunc='. ~/.functions.zsh'

alias conf="v ~/.zshrc"
alias confa="v ~/.aliases.zsh"
alias confga="v ~/.git_aliases.zsh"
alias confg="v ~/.gitconfig"
alias conff="v ~/.functions.zsh"
alias confp="v ~/.zsh_plugins.txt"
alias confv="v ~/.config/nvim/init.lua"

# My Stow
alias nostow="my_stow.xsh no"
alias restow="my_stow.xsh restow"
alias unstow="my_stow.xsh delete"


##* BREW ###

alias brupg="brew update && brew upgrade && mas upgrade"
alias brls="brew list"
alias brins="brew install"
alias bruni="brew uninstall"

brew_ending="--no-upgrade --verbose --file=~/dotfiles/Brewfile"
alias brcheck="brew bundle check $brew_ending"
alias brdump="brew bundle dump --force --describe $brew_ending"
alias brbundle="brew bundle $brew_ending"
unset brew_ending


##* LS ###

alias bls="/bin/ls"  

alias ls="exa --color=always --icons --group-directories-first"
alias sl="ls"
alias ll="ls -lb"
alias la="ls -a"
alias l.="exa -a | egrep '^\.'"
alias l="ls -lba"

lt() { la --tree "$@" | bat --style='grid,numbers' }
alias ltl="lt -L"
alias ltg="lt -I .git --git-ignore"


##* REPLACEMENTS ###

alias ps='procs'
alias cat='bat'
alias diff='batdiff'
alias rm='trash-put --trash-dir ~/.Trash'


##* NAVIGATION ###

alias ..='cd ..'
alias ...='cd ../..'

alias j='__zoxide_z'
alias ji='__zoxide_zi'
alias kj='j - >/dev/null'


##* MISC ###

alias nv='nvim'

# Python
alias py='python3'
alias po='poetry'

# List or search aliases
alias a='acs'

# Clipboard
alias cbc='pbcopy'
alias cbp='pbpaste'

# yt-dlp
alias yt-audio="yt-dlp --extract-audio --audio-format mp3"
alias yt-hd="yt-dlp -f 'bestvideo[height<=720][ext=mp4]+bestaudio[ext=m4a]'"
alias yt-fullhd="yt-dlp -f 'bestvideo[height<=1080][ext=mp4]+bestaudio[ext=m4a]'"
alias yt-best="yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]'"

# Confirmation
alias cp='cp -i'
alias mv='mv -i'
