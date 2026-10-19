# Dotfiles Setup (Linux & macOS)

Easily manage your development environment with these dotfiles.

## Quick Start

1. **Set up a GitHub SSH key.** The nvim config and Flutter are cloned over SSH.

2. **Clone the repo:**
   ```bash
   git clone https://github.com/RobertBrunhage/.dotfiles.git ~/.dotfiles
   ```

3. **Run the install script:**
   ```bash
   cd ~/.dotfiles && ./install.sh
   ```

The script is safe to run again, it keeps your local changes.

## What does the install script do?

- Runs setup scripts for your OS (macOS or Linux), installing Homebrew (macOS), Neovim, Flutter and other tools.
  On macOS every Homebrew package and app is listed in the [`Brewfile`](Brewfile).
- Clones the [nvim config](https://github.com/RobertBrunhage/nvim) into `nvim-config/` and symlinks it to `~/.config/nvim`.
- Optionally symlinks dotfiles to your home directory with `link.sh`, using [stow](https://www.gnu.org/software/stow/).
  Run `./link.sh` on its own to only update the symlinks.

## Shared and machine specific config

This repo is public, so it only has config that is fine to share. `~/.zshrc`, `~/.bashrc` and `~/.gitconfig` are
normal files on each machine instead of symlinks: `link.sh` creates them, and the shell ones load the shared config
from this repo (`~/.config/zsh/zshrc`, `~/.config/bash/bashrc`, git reads `~/.config/git/config` on its own).
Installers and tools like `gh auth login` add their lines to these local files, so work setup, credentials
and other machine specific things never end up in the repo.

Secrets go in `~/.secrets`, which `.zshenv` loads in every shell. Create it by hand on a new machine:

```bash
export SOME_TOKEN="..."
```

## Customization

- Add or edit files in the relevant folders (`zsh/`, `tmux/`, etc.). The nvim config is its own repo in `nvim-config/.config/nvim`.
- To symlink a new folder, add it to `link.sh`.

---

For questions or improvements, feel free to open an issue or PR.
