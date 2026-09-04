# Welcome to my dotfiles

Included here are my most important configuration files for my unix based systems.

## Install

Check the repo out into `~/Git/dotfiles`, then run:

```bash
./install.sh
```

The script symlinks each config file into place in `$HOME` (e.g. `bashrc` →
`~/.bashrc`, `commands` → `~/.commands`). It is safe to re-run: correct
symlinks are left alone, and any existing regular file at a target path is
backed up to `<name>.bak.<timestamp>` before being replaced.

## What's here

- `bashrc` — shell config (sources the fzf, commands, and neodocker files below)
- `commands` — command snippet library, browsed via the `c` alias with fzf
- `fzf_bindings.bash`, `fzf_completion.bash` — fzf shell integration
- `neodocker.rc` — neovim-in-docker helper functions
- `pureline.conf` — PureLine prompt config
- `screenrc`, `tmux.conf` — terminal multiplexer configs

My keyboard keymaps now live in their own [keyboards](../keyboards) repo.
