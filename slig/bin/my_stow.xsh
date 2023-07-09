#!/usr/bin/env xonsh

import json
import sys


def error(*args, **kwargs):
    print(*args, file=sys.stderr, **kwargs)
    exit(1)


def read_json(file_path):
    with open(file_path, 'r') as file:
        try:
            return json.load(file)
        except json.JSONDecodeError as e:
            error(f"Error while parsing {file_path}:", e, sep='\n')


def gum_print(text, reverse_colors=False):
    colors = [120, 212]
    if reverse_colors:
        colors.reverse()

    gum style \
	    --foreground @(colors[0]) --border-foreground @(colors[1]) --border double \
	    --align center --width 60 --margin "0 1" \
        @(text)


valid_args = ('no', 'delete', 'restow')
try:
    if $ARG1 not in valid_args:
        error('Valid arguments:', valid_args)
except KeyError:
    error('One argument is expected')

if $ARG1 == 'no':
    gum_print('SIMULATION MODE', reverse_colors=True)


path_pairs = read_json(${'HOME'} + '/dotfiles/slig/my_stow_config.json')

for path_pair in path_pairs:
    dotfiles_dir_name = path_pair['dotfiles'].split('/')[-1]
    gum_print(dotfiles_dir_name)

    dotfiles = f"-d '{path_pair['dotfiles']}'"

    # Default target is ../dotfiles
    target = path_pair.get('target', '')
    if target:
        target = f"-t '{target}'"         

    evalx(
        f"stow --{$ARG1} --verbose {dotfiles} {target} . 2>&1 |\
            grep -v -e '^BUG' -e '^WARN'"
    )
