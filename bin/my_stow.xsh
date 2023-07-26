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


def gum_print(text, header=False):
    colors = [120, 212]
    if header:
        text = text.upper()
        colors.reverse()

    gum style \
	    --foreground @(colors[0]) --border-foreground @(colors[1]) --border double \
	    --align center --width 60 --margin "0 1" \
        @(text)


def stow(dirs, target):
    target = f"-t '{target}'"         
    clean_output = "2>&1 | grep -v -e '^BUG' -e '^WARN'"

    for dotfiles in dirs:
        dir_name = dotfiles.split('/')[-1]
        gum_print(dir_name)

        dotfiles = f"-d '~/dotfiles/{dotfiles}'"
        evalx(f"stow --{$ARG1} --verbose {dotfiles} {target} . {clean_output}")
        

if __name__ == '__main__':
    valid_args = ('no', 'delete', 'restow')
    try:
        if $ARG1 not in valid_args:
            error('Only these arguments are valid:', valid_args)
    except KeyError:
        error('One argument is expected')

    if $ARG1 == 'no':
        gum_print('Simulation mode', header=True)

    config = read_json($HOME + '/dotfiles/my_stow_config.json')
    for relationship in config:
        stow(**relationship)
