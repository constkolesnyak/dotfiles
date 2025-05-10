reenv() {
    for file in ~/.*.env; do
        . "$file"
    done
}

realias() {
    unalias -a

    for file in ~/.*aliases.zsh; do
        . "$file"
    done
}

pwd_gum() {
    pwd | rev | cut -d '/' -f 1-5 | rev | gum style \
        --foreground '#02e8e8' --border-foreground 212 --border double \
        --align center --width 70
}

e() {
    if [ $# -eq 0 ]; then
        env
    else
        env | rg $@
    fi
}

o() {
    if [ $# -eq 0 ]; then
        open .
    else
        open $@
    fi
}

v() {
    if [ $# -eq 0 ]; then
        code .
    else
        code $@
    fi
}

nvi() {
    nv $(rg --hidden --line-number . |
        fzf --delimiter ':' --preview 'bat --color=always --highlight-line {2} {1}' |
        awk -F ':' '{print "+"$2" "$1}')
}

pymain() {
    local deep_main="$(gpath)/src/$(gname)/main.py"
    local shallow_main="$(gpath)/main.py"

    if [[ -e "$deep_main" ]]; then
        py "$deep_main" "$@"
    else
        py "$shallow_main" "$@"
    fi
}
