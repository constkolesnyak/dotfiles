codetemp() {
    # usage: echo asdf | codetemp tsv
    local ext="${1:-tsv}" f
    f="$(mktemp "${TMPDIR:-/tmp}/$(date +%s).${ext}")" || return
    /bin/cat > "$f"
    code "$f"
}

dump_some_cli_apps() {
    {
        npmls &&
            /bin/ls -lh ~/.local/bin | awk '{$6=$7=$8=""; print $0}' &&
            echo '' &&
            pipx list
    } | tee $DOTFILES/misc/some_cli_apps.txt
}

reenv() {
    for file in ~/.*.env; do
        source "$file"
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
        env | rg --ignore-case $@
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

subs_lr() {
    lr_files=(${POLYGLOTKA_EXPORTED_FILES_DIR}/${~POLYGLOTKA_LR_SUBS_GLOB_PATTERN}(N))
    if (( ${#lr_files} )); then
        polyglotka subs
    fi
}

subs_trans() {
    local DESCRIPTION="\
Translate as literally as possible, even idioms. \
Try to preserve original word order. \
Remove brackets and everything inside them."

    local LANG="Russian"
    local MODEL="gemini-2.5-flash"

    local SUBS_DIR="$HOME/google_drive/Misc/Subs"
    local INPUT_DIR="$SUBS_DIR/input_subs"
    local OUTPUT_DIR="$SUBS_DIR/output_subs"
    local TRASH_DIR="$SUBS_DIR/trash_subs"

    for old_trash_file in $TRASH_DIR/*(.mw+2N); do
        rm $old_trash
    done

    local input_files=(${INPUT_DIR}/*.srt(N))

    for input_file in $input_files; do
        [[ -e "$input_file" ]] || continue
        local output_file_name="$(basename "$input_file" .srt) - ${LANG}.srt"

        gemini-srt-translator translate \
            -i "$input_file" \
            -o "$OUTPUT_DIR/$output_file_name" \
            -l "$LANG" \
            -k "$GEMINI_SRT_TRANSLATOR_API_KEY" \
            --model "$MODEL" \
            --description "$DESCRIPTION" && \
            /bin/mv "$input_file" "$TRASH_DIR"
    done
}

subs() {subs_lr && subs_trans}
