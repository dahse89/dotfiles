# Dotfiles

My personal configuration files, shared between macOS and Linux. Each tool has its own directory; machine-specific state and generated files stay out of version control.

## Contents

- `nvim/` — Neovim configuration built on [NvChad](https://github.com/NvChad/NvChad) v2.5, including settings and plugin customizations.
- `herdr/` — Herdr configuration (`config.toml`). Sessions, snapshots, logs, and release-note state are ignored.
- `pi/` — Pi settings and local Ollama model configuration. Linked file-by-file so credentials and runtime state stay local.

## Setup

Install the tools you want to use and keep this repository at `~/dotfiles` on each machine. Back up or move existing Neovim and Herdr configuration directories and Pi's `settings.json` and `models.json` before creating the links below. Preserve local session data; do not replace the whole Pi agent directory. Run only the commands for tools you use.

```sh
config_home="${XDG_CONFIG_HOME:-$HOME/.config}"
mkdir -p "$config_home"
ln -s "$HOME/dotfiles/nvim" "$config_home/nvim"
ln -s "$HOME/dotfiles/herdr" "$config_home/herdr"

# Pi: link configuration files, leaving credentials and runtime state local.
pi_agent_dir="${PI_CODING_AGENT_DIR:-$HOME/.pi/agent}"
mkdir -p "$pi_agent_dir"
ln -s "$HOME/dotfiles/pi/settings.json" "$pi_agent_dir/settings.json"
ln -s "$HOME/dotfiles/pi/models.json" "$pi_agent_dir/models.json"
pi update --extensions
```

These commands link the Neovim and Herdr directories directly and Pi's configuration files individually. This layout does not require Stow. If you keep the repository elsewhere, adjust the source paths. Review machine-specific paths and commands before using the configurations on another OS.

### Neovim

Requires Neovim 0.11 or newer and Git. Start `nvim` after linking the configuration; Lazy.nvim installs the plugins on first launch.

Use `:Mason` to manage language tools. This configuration enables HTML, CSS, TypeScript, Vue, and Java LSPs; install `jdtls` for Java with `:MasonInstall jdtls`.

### Herdr

Install Herdr and link its configuration directory as shown above. Session state remains local to each machine and is not shared through Git.

### Pi

The setup commands above use Pi's default agent directory unless `PI_CODING_AGENT_DIR` is set. Run `/reload` in an existing Pi session after configuration changes.

`settings.json` declares the `pi-web-access` and `pi-agent-browser-native` packages; the setup commands reconcile these installations. The default provider is `openai-codex`; authenticate on each machine with `/login` and adjust the default model if needed. `models.json` configures Ollama at `http://localhost:11434/v1` with `gemma4:12b`; install Ollama and pull that model separately if you want to use it. The `ollama` API-key value is a placeholder, not a credential.

Keep credentials (`auth.json`), trust decisions (`trust.json`), sessions, generated model metadata (`models-store.json`), and installed packages/runtime files (`npm/`, `install/`, `bin/`) outside this repository. Existing skills and prompts remain local and are not migrated by these links. Review settings and model definitions for secrets and machine-specific paths before committing; edits through the symlinks also change the tracked files.

## Adding configuration

Add a directory for each new tool and link it to the location that tool expects. Track intentional configuration and useful lockfiles, but not credentials, caches, logs, or session state. Check `git status` before committing; `.gitignore` is not a substitute for reviewing files for secrets.

## Credits

Thanks to the NvChad maintainers and contributors for the Neovim framework, UI, and configuration modules. The NvChad starter was also inspired by [LazyVim's starter](https://github.com/LazyVim/starter).
