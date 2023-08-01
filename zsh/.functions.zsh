realias() {
    unalias -a

    for file in ~/.*aliases.zsh; do
        . "$file"
    done
}


reenv() {
    for file in ~/.*.env; do
        . "$file"
    done
}


mkd() {
	mkdir $1
	cd $1
}


nvi() {
    nv $(rg --hidden --line-number . |
        fzf --delimiter ':' --preview 'bat --color=always --highlight-line {2} {1}' |
        awk -F ':' '{print "+"$2" "$1}')
}


v() {
    if [ $# -eq 0 ]; then
        code .
    else
        code $@
    fi
}
