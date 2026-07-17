#!/usr/bin/env bash
# Symlinks these dotfiles into place. Run from anywhere after cloning this repo.
set -euo pipefail
cd "$(dirname "$0")"
DOTFILES="$(pwd)"

mkdir -p ~/.config/ghostty

ln -sfv "$DOTFILES/.zshrc" ~/.zshrc
ln -sfv "$DOTFILES/.zsh_plugins.txt" ~/.zsh_plugins.txt
ln -sfv "$DOTFILES/.gitconfig" ~/.gitconfig
ln -sfv "$DOTFILES/.config/ghostty/config" ~/.config/ghostty/config
ln -sfv "$DOTFILES/.config/starship.toml" ~/.config/starship.toml

echo ""
echo "Symlinked. Now install the packages this config expects:"
echo "  brew install antidote starship fzf atuin git-delta btop fastfetch eza zoxide ripgrep fd bat lazygit tmux"
echo "  brew install --cask font-jetbrains-mono-nerd-font"
echo ""
echo "If you need machine-specific secrets/env vars, put them in ~/.zshrc.local (gitignored, sourced automatically if present)."
