# dotfiles

Personal dev environment — nvim, tmux, ghostty.

## Stack

- **Terminal**: [Ghostty](https://ghostty.org) — TokyoNight Night, JetBrainsMono Nerd Font, semi-transparent with blur
- **Editor**: [Neovim](https://neovim.io) via [LazyVim](https://www.lazyvim.org) — TokyoNight (transparent), Angular LSP
- **Multiplexer**: [tmux](https://github.com/tmux/tmux) — vi mode, mouse on, top status bar, 1-indexed windows

## Install

```bash
git clone git@github.com:DiogoM14/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x install.sh
./install.sh
```

This symlinks each folder in `config/` to `~/.config/`.
