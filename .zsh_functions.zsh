mkd() {
	mkdir $1
	cd $1
}

nv_at_line() {
    nv $(rg --line-number . |
        fzf --delimiter ':' --preview 'bat --color=always --highlight-line {2} {1}' |
        awk -F ':' '{print "+"$2" "$1}')
}

lt() {
    la --tree --level=3 "$@" | cat
}

ltmax() {
    la --tree "$@" | cat
}

