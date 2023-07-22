# My Dotfiles

## About

Configs, aliases, and whatnot.

### Screenshot

![Dotfiles screenshot](https://i.imgur.com/bmxeWou.png)

### Built With

| Tool                                                | Description           |
| --------------------------------------------------- | --------------------- |
| [GNU Stow](https://www.gnu.org/software/stow/)      | Symlink farm manager  |
| [Homebrew](https://brew.sh/)                        | Package manager       |
| [Warp](https://www.warp.dev/)                       | Terminal              |
| [VS Code](https://code.visualstudio.com/)           | Editor                |
| [VSCodeVim](https://github.com/VSCodeVim/Vim)       | Vim emulator          |
| [Neovim](https://neovim.io/)                        | Additional editor     |
| [Packer](https://github.com/wbthomason/packer.nvim) | Neovim plugin manager |
| [Zsh](https://www.zsh.org/)                         | Shell                 |
| [Antidote](https://getantidote.github.io/)          | Zsh plugin manager    |
| [Starship](https://starship.rs/)                    | Prompt                |
| [Xonsh](https://xon.sh/)                            | Additional shell      |
| [defaults](https://macos-defaults.com/)             | macOS settings CLI    |

## How It Works

- 10x devs [put](https://dotfiles.github.io/inspiration) all of their dotfiles into respective subdirectories. I don't. Maybe someday I will.
- [`my_stow.xsh`](slig/bin/my_stow.xsh) passes [dirs and targets](https://www.gnu.org/software/stow/manual/stow.html#Invoking-Stow) from [`my_stow_config.json`](slig/my_stow_config.json) to GNU Stow.
- `slig` stands for ***S***tow ***L***ocal ***IG***nore. There are two differences from [`.stow-local-ignore`](https://www.gnu.org/software/stow/manual/stow.html#Types-And-Syntax-Of-Ignore-Lists):
    - `slig` is a directory.
    - `slig` doesn't override `~/.stow-global-ignore`.

## Installation

### 1) Preparation  

1. Clone the repo.

        git clone https://github.com/constkolesnyak/dotfiles.git ~/dotfiles

2. Source aliases.

    > Run `where some_alias` to understand aliases before executing them.

        . ~/dotfiles/.aliases.zsh

3. Add my scripts to your `PATH`.

        export PATH="$PATH:$HOME/dotfiles/slig/bin"

### 2) Homebrew

1. [Install Homebrew.](https://brew.sh/)

2. Check what apps are missing. Delete the ones you don't need from `slig/Brewfile`. 

        brcheck

3. Install apps.

        brbundle

### 3) Stow

1. Symlink `.stow-global-ignore`.

        ln -s ~/dotfiles/.stow-global-ignore ~/.stow-global-ignore

2. Run `my_stow.xsh` in simulation mode.

        nostow

3. Run `my_stow.xsh` for real.

        restow

### 3) Finally

- Source `~/.zshrc`.

        reload

### 4) Additionally

- [Sync](https://code.visualstudio.com/docs/editor/settings-sync) VS Code UI state. Unfortunately, it [can't](https://code.visualstudio.com/docs/editor/profiles#_where-is-the-ui-state-globalstatejson-file) be version controlled.

- Sync macOS settings with `defaults` scripts.

        # On your mac with desired settings
        defaults_export.zsh

        # On your other mac
        defaults_import.xsh

## Uninstall

    unstow
    /bin/rm -rf ~/dotfiles ~/.stow-global-ignore
