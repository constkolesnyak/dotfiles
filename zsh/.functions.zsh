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

v() {
    if [ $# -eq 0 ]; then
        code .
    else
        code $@
    fi
}

e() {
    if [ $# -eq 0 ]; then
        env
    else
        env | rg $@
    fi
}

nvi() {
    nv $(rg --hidden --line-number . |
        fzf --delimiter ':' --preview 'bat --color=always --highlight-line {2} {1}' |
        awk -F ':' '{print "+"$2" "$1}')
}
