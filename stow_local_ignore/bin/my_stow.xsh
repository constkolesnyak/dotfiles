#!/usr/bin/env xonsh

import json


def read_json(file_path):
    with open(file_path, 'r') as file:
        try:
            data = json.load(file)
            return data
        except json.JSONDecodeError as e:
            print("Error while parsing JSON file:", e)
            exit(1)


def gum_print(text):
    gum style \
	    --foreground 212 --border-foreground 212 --border double \
	    --align center --width 60 --margin "1 2" \
        @(text)


try:
    # $ARG1 can be 'no', 'delete', 'restow'
    main_flag = '--' + $ARG1
except KeyError:
    print('Argument is expected')
    exit(1)


path_pairs = read_json(${'HOME'} + '/dotfiles/stow_local_ignore/my_stow_config.json')

for path_pair in path_pairs:
    dotfiles_dir_name = path_pair['dotfiles'].split('/')[-1]
    gum_print(dotfiles_dir_name)

    dotfiles = f"-d '{path_pair['dotfiles']}'"

    # Default target is ../dotfiles
    target = path_pair.get('target', '')
    if target:
        target = f"-t '{target}'"         

    evalx(
        f"stow {main_flag} --verbose {dotfiles} {target} . 2>&1 |\
            grep -v -e '^BUG' -e '^WARN'"
    )
