# My Dotfiles


## About

Simple dotfiles with configs, aliases and whatnot

### Screenshot

![Dotfiles tree](https://i.imgur.com/bmxeWou.png)

### Built With

| Tool                                                | Description              |
| --------------------------------------------------- | ------------------------ |
| [GNU Stow](https://www.gnu.org/software/stow/)      | Symlink farm manager     |
| [Homebrew](https://brew.sh/)                        | Package manager          |
| [Warp](https://www.warp.dev/)                       | Terminal                 |
| [Neovim](https://neovim.io/)                        | Editor                   |
| [Packer](https://github.com/wbthomason/packer.nvim) | Neovim plugin manager    |
| [Zsh](https://www.zsh.org/)                         | Shell                    |
| [Antidote](https://getantidote.github.io/)          | Zsh plugin manager       |
| [Starship](https://starship.rs/)                    | Prompt                   |
| [Xonsh](https://xon.sh/)                            | Additional shell         |


## Installation

1. Clone the repo
   ```sh
   git clone https://github.com/constkolesnyak/dotfiles.git ~/dotfiles
   ```

2. Source aliases

   _**Note**: run_ `where some_alias` _to understand aliases before executing them_

   ```sh
   . ~/dotfiles/.aliases.zsh
   ```

3. Install apps via Homebrew

   _**Note**: remove apps you don't need from the_ `Brewfile` _before installation_

   ```sh
   brbundle
   ```

4. Run Stow in simulation mode
   ```sh
   nostow
   ```

5. Run Stow for real
   ```sh
   restow
   ```

6. Source `.zshrc`
   ```sh
   reload
   ```

7. Sync macOS settings with defaults scripts in `stow_ignore/bin/`
   ```sh
   # On your mac with desired settings
   ./defaults_export.zsh
   
   # On your new mac
   ./defaults_import.xsh
   ```
