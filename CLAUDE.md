# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal dotfiles repository for macOS that uses **Cstow** (a GNU Stow wrapper) to manage symlinked configuration files. The repository manages configs for Zsh, VS Code, Neovim, Git, and various CLI tools.

## Key Commands

### Stow Operations (symlink management)
```bash
nostow      # Simulation mode - preview what will be symlinked
ststow      # Create symlinks for real
restow      # Re-stow existing links (useful after adding new files)
destow      # Remove all symlinks
```

### Homebrew
```bash
brcheck     # Check what apps from Brewfile are missing
brbundle    # Install apps from Brewfile
brupgall    # Update everything (brew, mas, uv tools) and dump Brewfile
```

### Shell
```bash
reload      # Source ~/.zshrc after changes
```

## Architecture

### Cstow Configuration (`cstow.toml`)
Maps source directories to target locations:
- `misc/home`, `zsh`, `git`, `python` → `~` (home directory)
- `vscode` → `~/Library/Application Support/Code/User`

### Directory Structure
- **zsh/**: Shell configuration (`.zshrc`, `.zprofile`, aliases, functions, environment variables)
- **git/**: Git config, aliases, and functions
- **vscode/**: VS Code settings, keybindings, tasks, and snippets
- **python/**: Python-specific aliases
- **misc/home/**: Additional home directory configs (gh, nvim, starship, warp)
- **bin/**: Helper scripts (macOS defaults export/import)
- **Brewfile**: Homebrew packages, casks, and Mac App Store apps

### Alias Organization
Aliases are split into tool-specific files in `zsh/`:
- `.aliases.zsh` - General aliases (dotfiles, brew, navigation, etc.)
- `.docker_aliases.zsh`, `.kubernetes_aliases.zsh`, `.azure_aliases.zsh`, etc.
- `.git_aliases.zsh` in `git/` directory

### Shell Plugin Management
Uses Antidote plugin manager with plugins listed in `zsh/.zsh_plugins.txt`.
