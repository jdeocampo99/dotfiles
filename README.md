# dotfiles

Ghostty + zsh + git config. Catppuccin Mocha theme, Starship prompt, antidote for zsh plugins, fzf/atuin for search, delta for git diffs.

## Setup

```sh
git clone https://github.com/jdeocampo99/dotfiles.git ~/dotfiles
~/dotfiles/install.sh
```

Then install the packages the config expects (also printed by `install.sh`):

```sh
brew install antidote starship fzf atuin git-delta btop fastfetch eza zoxide ripgrep fd bat lazygit tmux
brew install --cask font-jetbrains-mono-nerd-font
```

## Machine-specific / personal config

Not tracked here on purpose — create these yourself on each machine:

- `~/.zshrc.local` — personal aliases, machine-specific PATH entries, secrets/env vars. Sourced automatically by `.zshrc` if present.
- `~/.gitconfig.local` — your `[user]` name/email and any local-only git tool config. Included automatically by `.gitconfig` if present.

Example `~/.gitconfig.local`:

```ini
[user]
	name = Your Name
	email = you@example.com
```
