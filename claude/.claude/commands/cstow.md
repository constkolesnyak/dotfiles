Add a file to cstow dotfiles management.

The user wants to add the file at the path `$ARGUMENTS` to cstow so it is tracked in the dotfiles repo and symlinked back.

## cstow configuration

- Config: `/Users/konst/dotfiles/cstow.toml`
- Root dir: `$DOTFILES` = `/Users/konst/dotfiles`
- Packages and their target directories:
  - `~` : `misc/home`, `zsh`, `git`, `python`, `claude`
  - `~/Library/Application Support/Code/User` : `vscode`

## How cstow works

Each package directory mirrors its target directory structure. Files placed in a package get symlinked into the target. For example:
- File `~/dotfiles/claude/.claude/settings.json` gets symlinked to `~/.claude/settings.json`
- File `~/dotfiles/vscode/settings.json` gets symlinked to `~/Library/Application Support/Code/User/settings.json`

## Steps

1. **Resolve the file path** to an absolute path. Verify the file exists and is a regular file (not already a symlink).

2. **Determine the package** by checking which target directory the file falls under. Ask the user to pick a package if it's ambiguous (e.g., a file under `~` could go in any of the `~`-targeted packages). For files under `~/.claude/`, use the `claude` package.

3. **Compute the destination** in the dotfiles repo. The destination is: `~/dotfiles/<package>/<relative-path-from-target>`. For example, if the file is `~/.claude/mcpick/servers.json` and the package is `claude` (target `~`), the destination is `~/dotfiles/claude/.claude/mcpick/servers.json`.

4. **Create the directory** in the dotfiles repo:
   ```
   mkdir -p <destination-directory>
   ```

5. **Move the file** from its current location into the dotfiles repo:
   ```
   mv <original-path> <destination-path>
   ```

6. **Run cstow stow** to create symlinks:
   ```
   cstow -a stow
   ```

7. **Verify** the symlink was created correctly:
   - `readlink <original-path>` should point to the dotfiles repo
   - The file content should still be accessible through the symlink
