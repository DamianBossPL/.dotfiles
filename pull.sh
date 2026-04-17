#!/bin/sh
set -e

if ! command -v git >/dev/null 2>&1; then
  sudo pacman -S --no-confirm git
fi

git clone https://github.com/DamianBossPL/.dotfiles ~/.dotfiles
exec ~/.dotfiles/install.sh