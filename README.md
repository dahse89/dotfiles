# Dotfiles

My personal configuration files, shared between macOS and Linux. Each tool has its own directory; machine-specific state and generated files stay out of version control.

## Contents

- `nvim/` — Neovim configuration built on [NvChad](https://github.com/NvChad/NvChad) v2.5, including settings and plugin customizations.
- `herdr/` — Herdr configuration (`config.toml`). Sessions, snapshots, logs, and release-note state are ignored.

## Setup

Install the tools you want to use and keep this repository at `~/dotfiles` on each machine. Back up or move any existing configuration directories before creating the links below, preserving any local session data you want to keep.

```sh
config_home="${XDG_CONFIG_HOME:-$HOME/.config}"
mkdir -p "$config_home"
ln -s "$HOME/dotfiles/nvim" "$config_home/nvim"
ln -s "$HOME/dotfiles/herdr" "$config_home/herdr"
```

These commands link the tool directories directly; this layout does not require Stow. If you keep the repository elsewhere, adjust the source paths. Review machine-specific paths and commands before using the configurations on another OS.

### Neovim

Requires Neovim 0.11 or newer and Git. Start `nvim` after linking the configuration; Lazy.nvim installs the plugins on first launch.

Use `:Mason` to manage language tools. This configuration enables HTML, CSS, TypeScript, Vue, and Java LSPs; install `jdtls` for Java with `:MasonInstall jdtls`.

### Herdr

Install Herdr and link its configuration directory as shown above. Session state remains local to each machine and is not shared through Git.

## Adding configuration

Add a directory for each new tool and link it to the location that tool expects. Track intentional configuration and useful lockfiles, but not credentials, caches, logs, or session state. Check `git status` before committing; `.gitignore` is not a substitute for reviewing files for secrets.

## Credits

Thanks to the NvChad maintainers and contributors for the Neovim framework, UI, and configuration modules. The NvChad starter was also inspired by [LazyVim's starter](https://github.com/LazyVim/starter).
