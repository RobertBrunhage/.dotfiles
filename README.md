# Dotfiles Setup (Linux & macOS)

Easily manage your development environment with these dotfiles.

## Quick Start

1. **Clone the repo:**
   ```bash
   git clone https://github.com/RobertBrunhage/.dotfiles.git
   ```

2. **Run the install script:**
   ```bash
   ./install.sh
   ```

## What does the install script do?

- Runs setup scripts for your OS (macOS or Linux).
- Optionally downloads extra configuration files (git submodules).
- Optionally symlinks dotfiles to your home directory using [stow](https://www.gnu.org/software/stow/).

## Customization

- Add or edit files in the relevant folders (`nvim/`, `zsh/`, etc.).
- To symlink a new folder, add it to the `install.sh` script.

---

For questions or improvements, feel free to open an issue or PR.
