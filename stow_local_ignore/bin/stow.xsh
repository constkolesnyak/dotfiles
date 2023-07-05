#!/usr/bin/env xonsh


try:
# ARG1 can be 'no', 'delete', 'restow'
    main_flag = '--' + $ARG1
except KeyError:
    print('Argument is expected')
    exit(1)


# dotfiles_path [-t target_path]
path_pairs = [
    "~/dotfiles",
    "~/dotfiles/stow_local_ignore/VSCode -t '~/Library/Application Support/Code/User'"
]


for path_pair in path_pairs:
    dotfiles_dir_name = path_pair.split()[0].split('/')[-1]

    gum style \
	    --foreground 212 --border-foreground 212 --border double \
	    --align center --width 60 --margin "1 2" \
        @(dotfiles_dir_name)

    # GNU Stow is full of bugs. I don't want to see them
    evalx(
        f"stow {main_flag} --verbose -d {path_pair} . 2>&1 |\
            grep -v -e '^BUG' -e '^WARN'"
    )

