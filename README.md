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

## Usage

**History / search (atuin)**
- `↑` / `↓` — open atuin's interactive search (replaces plain history cycling)
- `Ctrl+R` — same search, callable mid-line
- Type to fuzzy-filter, `Enter` to run, `Esc` to cancel

**Fuzzy finder (fzf)**
- `Ctrl+T` — fuzzy-find a file/dir under cwd, inserts the path at your cursor
- `Alt+C` — fuzzy-find a directory and `cd` into it
- Pipe anything into it yourself, e.g. `git branch | fzf`

**Prompt (starship)** — shows automatically, nothing to invoke:
- current dir, git branch, git status (`staged`/`modified`/`untracked`/etc. in plain words), language runtime version (only in relevant projects), command duration for anything over 2s

**zsh plugins (antidote)**
- Ghost-text autocomplete as you type — `→` (right arrow) or `End` to accept the suggestion
- Commands are syntax-highlighted live (green = valid, red = typo/invalid) before you hit enter

**File listing (eza aliases)**
- `ls` / `ll` (long) / `la` (long + hidden) / `lt` (tree, 2 levels) / `lta` (tree + hidden)

**Navigation**
- `..` / `...` / `....` — go up 1/2/3 directories
- `z <partial-name>` — zoxide jump to a frecent directory (e.g. `z dotfiles`)

**Git**
- `git diff` / `git log -p` — now rendered side-by-side with syntax highlighting via delta
- Aliases: `git st` (status), `git cm "msg"` (commit), `git co`/`git cob` (checkout/checkout -b), `git l` (graph log), `git undo` (soft-reset last commit)
- `lazygit` — full terminal UI for staging, committing, branching

**System monitor**
- `btop` — mouse-driven CPU/mem/disk/net monitor, `q` to quit

**Fun**
- `fastfetch` — system info banner with OS logo

**Ghostty**
- `custom-shader` line in `.config/ghostty/config` for CRT/glow effects (not enabled by default)
- `cmd+shift+,` — reload config live after editing

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
