#!/usr/bin/env xonsh

#TODO: rewrite this script in python

import json
import sys
import os


DOTFILES_PATH = $HOME + '/dotfiles'
CONFIG_PATH = DOTFILES_PATH + '/my_stow_config.json'


def error(*args, **kwargs):
    print('ERROR: ', file=sys.stderr, end='')
    print(*args, file=sys.stderr, **kwargs)
    exit(1)


def check_path(path, name):
    if not os.path.exists(path):
        error(name, 'is not found:', path)


def check_args():
    if len($ARGS) != 2:
        error('Exactly one argument is expected')

    valid_args = ('no', 'delete', 'restow')
    if $ARG1 not in valid_args:
        error('Only these arguments are valid:', ", ".join(valid_args))
    

def read_json(file_path):
    with open(file_path, 'r') as file:
        try:
            return json.load(file)
        except json.JSONDecodeError as err:
            error(f"Invalid json in config:", err, sep='\n')


def gum_print(text, header=False):
    colors = [120, 212]
    if header:
        text = text.upper()
        colors.reverse()

    gum style \
	    --foreground @(colors[0]) --border-foreground @(colors[1]) --border double \
	    --align center --width 60 --margin "0 1" \
        @(text)


def stow(action, dirs, target):
    if target.startswith('~'):
        target = $HOME + target[1:]
    check_path(target, 'Target directory')

    for dotfiles in dirs:
        dotfiles = f'{DOTFILES_PATH}/{dotfiles}'
        check_path(dotfiles, 'Directory with dotfiles (element of "dirs")')

        dir_name = dotfiles.split('/')[-1]
        gum_print(dir_name)

        clean_output = "2>&1 | grep -v -e '^BUG' -e '^WARN'"
        command = f"stow --{action} --no-folding --verbose -d '{dotfiles}' -t '{target}' . {clean_output}"
        evalx(command)
        

if __name__ == '__main__':
    check_args()
    action = $ARG1
    if action == 'no':
        gum_print('Simulation mode', header=True)

    check_path(CONFIG_PATH, 'Config file')
    config = read_json(CONFIG_PATH)
    for relationship in config:
        try:
            stow(action, **relationship)
        except TypeError:
            error('Only these keys are valid in config: target, dirs')
