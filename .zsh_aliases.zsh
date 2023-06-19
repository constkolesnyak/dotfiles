### DOTFILES ###

alias reload='. ~/.zshrc'

alias conf="$EDITOR ~/.zshrc"
alias confa="$EDITOR ~/.zsh_aliases.zsh"
alias conff="$EDITOR ~/.zsh_functions.zsh"
alias confp="$EDITOR ~/.zsh_plugins.txt"
alias confv="$EDITOR ~/.config/nvim/init.lua"

# GNU Stow is full of bugs but it's good enough
stow_ending="--verbose -d ~/.dotfiles . 2>&1 | grep -v '^BUG'"
alias nostow="stow --no $stow_ending"  # dry run
alias restow="stow --restow $stow_ending"
alias unstow="stow --delete $stow_ending"
unset stow_ending


### GIT ###

alias g="git"


### LS ###

# For piping
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


### REPLACEMENTS ###

alias ps='procs'
alias cat='bat'
alias diff='batdiff'
alias rm='trash-put --trash-dir ~/.Trash'


### MISC ###

# Editors
alias v='code'
alias nv='nvim'

# Python
alias py='python3'

# Clipboard
alias cbc='pbcopy'
alias cbp='pbpaste'

# yt-dlp
alias yt-audio="yt-dlp --extract-audio --audio-format mp3"
alias yt-hd="yt-dlp -f 'bestvideo[height<=720][ext=mp4]+bestaudio[ext=m4a]'"
alias yt-fullhd="yt-dlp -f 'bestvideo[height<=1080][ext=mp4]+bestaudio[ext=m4a]'"
alias yt-best="yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]'"

# Confirmations
alias cp='cp -i'
alias mv='mv -i'

# Navigation
alias ..='cd ..'
alias ...='cd ../..'

