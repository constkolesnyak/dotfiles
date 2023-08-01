##* DOTFILES ###

alias reload='. ~/.zshrc'
alias refunc='. ~/.functions.zsh'

alias conf="v ~/dotfiles"

# My Stow
alias nostow="my_stow.xsh no"
alias restow="my_stow.xsh restow"
alias unstow="my_stow.xsh delete"


##* BREW ###

alias brupg="brew update && brew upgrade && mas upgrade"
alias brls="brew list"
alias brins="brew install"
alias bruni="brew uninstall"

brew_ending="--no-upgrade --verbose --file=$DOTFILES/Brewfile"
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
alias diff='batdiff'
alias rm='trash-put --trash-dir ~/.Trash'
alias du='ncdu'

alias bcat='/bin/cat'
alias cat='bat'


##* NAVIGATION ###

alias ..='cd ..'
alias ...='cd ../..'

alias j='__zoxide_z'
alias ji='__zoxide_zi'
alias kj='j - >/dev/null'


##* PYTHON ###

alias py='python3'


##* POETRY ###

alias po='poetry'

alias ponew='poetry new --no-interaction'
alias popublish='poetry publish --build'

alias poadd='poetry add'
poaddev() { poetry add "$@" --group dev }
alias porm='poetry remove'

alias poins='poetry install'
alias poupd='poetry update'
alias posync='poetry install --sync'
alias polock='poetry lock'

alias poshe='poetry shell'
alias porun='poetry run'

alias poinf='poetry env info'
alias posho='poetry show'
alias poche='poetry check'
alias pochelo='poetry lock --check'

alias poman='poetry help'


##* MISC ###

alias nv='nvim'

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
