subs_lr() {
    lr_files=(${POLYGLOTKA_EXPORTED_FILES_DIR}/${~POLYGLOTKA_LR_SUBS_GLOB_PATTERN}(N))
    if (( ${#lr_files} )); then
        polyglotka subs
    fi
}

clean_srt() {
    # Remove lines w/o a single space
    local no_space='^[0-9]+\n[0-9:, -->]+\n(?![^\n]* )[^\n]+\n?$'
    local clean="${1%.srt} - clean.srt"
    local dirt="${1%.srt} - dirt.srt"
    perl -00 -ne "print unless /$no_space/" "$1" > "$clean"
    perl -00 -ne "print if /$no_space/" "$1" > "$dirt"
}

subs_trans() {
    local PROMPT="\
Translate as literally as possible. \
Preserve original word order where grammatical. \
\
Delete brackets and everything inside them, e.g.（ナズナ）. \
Delete lines containing '♪'. \
Delete emotional or filler exclamations such as \
'Ah', 'A?', 'Eh?', 'Ugh', 'Oh...', 'Wow!', and any Japanese equivalents. \
\
Trim leading/trailing whitespace. \
After all deletions and trimming, if a line is empty, output 'deleted'.\
"

    local LANG="Russian"
    local MODEL="gemini-2.5-pro"

    local SUBS_DIR="$HOME/garage/Subs"
    local INPUT_DIR="$SUBS_DIR/input_subs"
    local OUTPUT_DIR="$SUBS_DIR/output_subs/japanese_subs"
    local TRASH_DIR="$SUBS_DIR/trash_subs"

    local input_files=(${INPUT_DIR}/*.srt(N))
    if (( ! ${#input_files} )); then
        return 0
    fi

    for old_trash_file in $TRASH_DIR/*(.mw+2N); do
        rm $old_trash_file
    done

    echo "Translating:"
    for input_file in $input_files; do
        echo "$(basename "$input_file" .srt)"
    done
    sleep 0.5

    for input_file in $input_files; do
        input_file_basename="$(basename "$input_file" .srt)"
        local output_file_name="$input_file_basename - ${LANG}.srt"
        local output_file="$OUTPUT_DIR/$output_file_name"

        gemini-srt-translator translate \
            -i "$input_file" \
            -o "$output_file" \
            -l "$LANG" \
            -k "$GEMINI_SRT_TRANSLATOR_API_KEY" \
            --model "$MODEL" \
            --progress-log \
            --description "$PROMPT"

        local progress_files=(${INPUT_DIR}/*.progress(N))
        if (( ${#progress_files} )); then
            /bin/mv ${progress_files[@]} "$TRASH_DIR"
        else
            /usr/bin/touch "$input_file"
            /bin/mv "$input_file" "$TRASH_DIR"
            clean_srt "$output_file"
        fi
    done

    /bin/mv "$INPUT_DIR"/*.log "$TRASH_DIR"
    find "$OUTPUT_DIR" -name '*.srt' ! -name '*clean.srt' ! -name '*_primary.srt' ! -name '*_secondary.srt' -exec /bin/mv {} "$TRASH_DIR/" \;
}

subs() {
    subs_lr
    subs_trans
}
