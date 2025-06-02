##* DOTFILES ###

alias reload='. ~/.zshrc'

alias conf='v ~/dotfiles'

alias nostow='cstow no'
alias ststow='cstow stow'
alias restow='cstow restow'
alias destow='cstow delete'

##* BREW ###

alias brupg='brew update && brew upgrade'
alias brupgall='brew update && brew upgrade && mas upgrade && pipx upgrade-all && brdump && dump_some_cli_apps'
alias brls='brew list'
alias brg='brew list | rg'
alias brins='brew install'
alias bruni='brew uninstall'

brew_ending="--no-upgrade --verbose --file=$DOTFILES/Brewfile"
alias brcheck="brew bundle check $brew_ending"
alias brdump="brew bundle dump --force --describe $brew_ending"
alias brbundle="brew bundle $brew_ending"
unset brew_ending

##* NODE ###

alias npmins='npm install -g'
alias npmuni='npm uninstall -g'
alias npmls='npm list -g --depth=0'

##* LS ###

alias bls='/bin/ls'

alias ls='eza --color=always --icons --group-directories-first'
alias sl='ls'
alias ll='ls -lb'
alias la='ls -a'
alias l.='eza -a | egrep "^\."'
alias l='ls -lba'

lt() {la --tree "$@" | bat --style='grid,numbers'}
alias ltl='lt -L'
alias ltg='lt -I .git --git-ignore'

alias lgss='ls -lba && git status -s 2>/dev/null || true'
alias pwd_gum_lgss='[ "$(pwd)" != "$HOME" ] && pwd_gum && lgss'

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
    pwd_gum_lgss
}
ji_() {__zoxide_zi "$@" && pwd_gum_lgss}
alias j=' j_'
alias ji=' ji_'

##* REPLACEMENTS ###

alias ps='procs'
alias diff='batdiff'
alias rm_='trash-put --trash-dir ~/.Trash'
alias rm='rm_'
alias du='ncdu'

alias bcat='/bin/cat'
alias cat='bat'

##* MISC ###

# List or search aliases
alias a='als'

# Clipboard
alias cbc='pbcopy'
alias cbp='pbpaste'

# yt-dlp
alias yt-audio="yt-dlp --extract-audio --audio-format mp3"
alias yt-hd="yt-dlp -f 'bestvideo[height<=720][ext=mp4]+bestaudio[ext=m4a]'"
alias yt-fullhd="yt-dlp -f 'bestvideo[height<=1080][ext=mp4]+bestaudio[ext=m4a]'"
alias yt-high="yt-dlp -f 'bestvideo[height<=1440][ext=mp4]+bestaudio[ext=m4a]'"
alias yt-best="yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]'"

# Confirmation
alias cp='cp -i'
alias mv='mv -i'

# SSH
alias familyvpn='ssh vpn -t vnstat --months'

# Misc Misc
w() {
    resolved="$1"
    if alias "$1" &>/dev/null; then
        resolved=$(alias "$1" | cut -d"'" -f2)
    fi

    viddy --disable_auto_save -d -n 1 --shell zsh "$resolved ${*:2}"
}

alias wh=where
alias ring='say "no more jobs"'
alias fucking=sudo
alias nv='nvim'
alias encrypt='gpg --no-symkey-cache --symmetric --cipher-algo AES256'
decrypt() {gpg --no-symkey-cache --output ${1%.gpg} --decrypt $1}
mkd() {mkdir $1 && cd $1}
mov_to_gif() {ffmpeg -i "$1.mov" -pix_fmt rgb8 -r 10 "$1.gif" && gifsicle -O3 "$1.gif" -o "$1.gif"}
alias ghostscript='/opt/homebrew/bin/gs' # compress pdf
