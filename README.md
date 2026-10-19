# Dotfiles Setup (Linux & macOS)

Easily manage your development environment with these dotfiles.

## Quick Start

1. **Set up a GitHub SSH key.** The nvim config, Flutter and the personal submodule are cloned over SSH.

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
- Clones the [nvim config](https://github.com/RobertBrunhage/nvim) into `nvim-config/` and symlinks it to `~/.config/nvim`.
- Optionally downloads extra configuration files (git submodules).
- Optionally symlinks dotfiles to your home directory using [stow](https://www.gnu.org/software/stow/).

## Secrets

Tokens and other secrets go in `~/.secrets`, which `.zshenv` loads in every shell. It lives outside this repo so it is never committed, create it by hand on a new machine:

```bash
export SOME_TOKEN="..."
```

## Customization

- Add or edit files in the relevant folders (`zsh/`, `tmux/`, etc.). The nvim config is its own repo in `nvim-config/.config/nvim`.
- To symlink a new folder, add it to the `install.sh` script.

---

For questions or improvements, feel free to open an issue or PR.
