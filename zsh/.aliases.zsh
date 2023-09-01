##* DOTFILES ###

alias reload='. ~/.zshrc'

alias conf="v ~/dotfiles"

alias nostow="cstow no"
alias ststow="cstow stow"
alias restow="cstow restow"
alias destow="cstow delete"

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

lt() {la --tree "$@" | bat --style='grid,numbers'}
alias ltl="lt -L"
alias ltg="lt -I .git --git-ignore"

alias lgss='ls -lba && git status -s 2>/dev/null || true'
alias pwd_gum_lgss='pwd_gum && lgss'

##* REPLACEMENTS ###

alias ps='procs'
alias diff='batdiff'
alias rm_='trash-put --trash-dir ~/.Trash'
alias rm="rm_" # better expansion
alias du='ncdu'

alias bcat='/bin/cat'
alias cat='bat'

##* NAVIGATION ###

alias h=' cd' # home
alias ..=' cd .. && pwd_gum_lgss'
alias ...=' cd ../.. && pwd_gum_lgss'

j_() {
    if [ $# -eq 0 ]; then
        __zoxide_z - >/dev/null
    else
        __zoxide_z "$@"
    fi
    [ "$(pwd)" != "$HOME" ] && pwd_gum_lgss
}
ji_() {__zoxide_zi "$@" && pwd_gum_lgss}
alias j=' j_'
alias ji=' ji_'

##* MISC ###

alias nv='nvim'
mkd() {mkdir $1 && cd $1}

mov_to_gif() {ffmpeg -i "$1.mov" -pix_fmt rgb8 -r 10 "$1.gif" && gifsicle -O3 "$1.gif" -o "$1.gif"}

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
