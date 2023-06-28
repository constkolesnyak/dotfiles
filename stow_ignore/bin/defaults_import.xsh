#!/usr/bin/env xonsh

import os


try:
    defaults_dir = $ARG1
except KeyError:
    defaults_dir = $HOME + "/Desktop/Defaults"

if not os.path.isdir(defaults_dir):
    print(f"Directory '{defaults_dir}' does not exist")
    exit(1)


plist_paths = $(ls -R @(defaults_dir)/*/*.plist)

for plist_path in plist_paths.split():
    domain = plist_path.split('/')[-1][:-6]
    defaults import @(domain) @(plist_path)
    print(domain)

