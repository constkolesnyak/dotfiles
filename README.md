# My Dotfiles

## About

Simple dotfiles with configs, aliases, and whatnot.

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
| [Xonsh](https://xon.sh/)                            | Additional shell      |
| [Starship](https://starship.rs/)                    | Prompt                |
| [defaults](https://macos-defaults.com/)             | macOS settings CLI    |

## How It Works

-   10x devs [put](https://dotfiles.github.io/inspiration) all of their dotfiles into respective subdirectories. I don't. Maybe someday I will.
-   [`my_stow.xsh`](slig/bin/my_stow.xsh) passes [dirs and targets](https://www.gnu.org/software/stow/manual/stow.html#Invoking-Stow) from [`my_stow_config.json`](slig/my_stow_config.json) to GNU Stow.
-   `slig` stands for ***S***tow ***L***ocal ***IG***nore. There are two differences from [`.stow-local-ignore`](https://www.gnu.org/software/stow/manual/stow.html#Types-And-Syntax-Of-Ignore-Lists):
    -   `slig` is a directory.
    -   `slig` doesn't override `~/.stow-global-ignore`.

## Installation

1. Clone the repo.

    ```sh
    git clone https://github.com/constkolesnyak/dotfiles.git ~/dotfiles
    ```

1. Source aliases.

    _**Note**: run_ `where some_alias` _to understand aliases before executing them_.

    ```sh
    . ~/dotfiles/.aliases.zsh
    ```

1. Install apps via Homebrew.

    _**Note**: remove apps you don't need from_ `slig/Brewfile` _before installation_.

    ```sh
    brbundle
    ```

1. Add my scripts to your `PATH`.

    ```sh
    export PATH="$PATH:$HOME/dotfiles/slig/bin"
    ```

1. Symlink `.stow-global-ignore`.

    ```sh
    ln -s ~/dotfiles/.stow-global-ignore ~/.stow-global-ignore
    ```

1. Run `my_stow.xsh` in simulation mode.

    ```sh
    nostow
    ```

1. Run `my_stow.xsh` for real.

    ```sh
    restow
    ```

1. Source `~/.zshrc`.

    ```sh
    reload
    ```

1. Sync macOS settings with `defaults` scripts.

    ```sh
    # On your mac with desired settings
    defaults_export.zsh

    # On your new mac
    defaults_import.xsh
    ```
