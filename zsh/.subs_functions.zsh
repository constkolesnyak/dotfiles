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
    local DESCRIPTION="\
Translate as literally as possible, including idioms. \
Preserve source word order where grammatical. \
\
Delete brackets and everything inside them. \
Delete lines containing '♪'. \
\
Absolutely remove any emotional or filler exclamations such as \
“Ah”, “A?”, “Eh?”, “Ugh”, “Oh...”, “Wow!”, and any Japanese equivalents. \
They should never appear in the output. \
If a line only contains them, delete the line. \
If a line starts or ends with them, cut them out. \
\
Trim leading/trailing whitespace. \
After all deletions and trimming, if a line is empty, output '[empty]'. \
"

    local LANG="Russian"
    local MODEL="gemini-2.5-flash"

    local SUBS_DIR="$HOME/garage/Subs"
    local INPUT_DIR="$SUBS_DIR/input_subs"
    local OUTPUT_DIR="$SUBS_DIR/output_subs"
    local TRASH_DIR="$SUBS_DIR/trash_subs"

    for old_trash_file in $TRASH_DIR/*(.mw+2N); do
        rm $old_trash
    done

    local input_files=(${INPUT_DIR}/*.srt(N))

    for input_file in $input_files; do
        input_file_basename="$(basename "$input_file" .srt)"
        echo "Translating: $input_file_basename"
        local output_file_name="$input_file_basename - ${LANG}.srt"
        local output_file="$OUTPUT_DIR/$output_file_name"

        gemini-srt-translator translate \
            -i "$input_file" \
            -o "$output_file" \
            -l "$LANG" \
            -k "$GEMINI_SRT_TRANSLATOR_API_KEY" \
            --model "$MODEL" \
            --progress-log \
            --description "$DESCRIPTION" && \
            /usr/bin/touch "$input_file" && \
            /bin/mv "$input_file" "$TRASH_DIR" && \
            clean_srt "$output_file"
    done

    /bin/mv "$INPUT_DIR"/*.log "$TRASH_DIR"
    find "$OUTPUT_DIR" -name '*.srt' ! -name '*clean.srt' -exec /bin/mv {} "$TRASH_DIR/" \;
}

subs() {subs_lr && subs_trans}
