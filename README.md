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
| [VS Code](https://code.visualstudio.com/)           | Editor                   |
| [Neovim](https://neovim.io/)                        | Additional editor        |
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

1. Source aliases

   _**Note**: run_ `where some_alias` _to understand aliases before executing them_

   ```sh
   . ~/dotfiles/.aliases.zsh
   ```

1. Install apps via Homebrew

   _**Note**: remove apps you don't need from the_ `Brewfile` _before installation_

   ```sh
   brbundle
   ```

1. Add my scripts to PATH

   ```sh
   export PATH="$PATH:$HOME/dotfiles/slig/bin"
   ```

1. Symlink .stow-global-ignore

   ```sh
   ln -s ~/dotfiles/.stow-global-ignore ~/.stow-global-ignore
   ```

1. Run Stow in simulation mode
   ```sh
   nostow
   ```

1. Run Stow for real
   ```sh
   restow
   ```

1. Source `.zshrc`
   ```sh
   reload
   ```

1. Sync macOS settings with defaults scripts 
   ```sh
   # On your mac with desired settings
   defaults_export.zsh
   
   # On your new mac
   defaults_import.xsh
   ```
