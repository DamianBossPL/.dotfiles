#!/bin/bash

# # Help menu
# show_help() {
#   echo "Usage: $0 [OPTION...] [SERVICE...]"
#   echo "Install dotfile requirements for DamianBossPL's .dotfiles"
#   echo
#   echo "Options:"
#   echo "    -h, --help       Display this help message and exit."
#   echo "    -a, --all        Installs everything"
#   echo "    -e, --exclude    Excludes listed services, installing ones which are not mentioned"
#   echo
#   echo "Services:"
#   echo "    yay"
#   echo "    hyprland"
#   echo "    git"

# }

# # --- Script Start --- #

# case "$1" in
#   -h|--help)
#     show_help
#     exit 0
#     ;;
#   -v|--version)
#     echo "Sample Script Version 1.0"
#     exit 0
#     ;;
#   "") # No arguments provided
#     show_help
#     exit 0
#     ;;
#   *) # Unknown option
#     echo "Error: Unknown option '$1'"
#     show_help
#     exit 1
#     ;;
# esac

# --- Install yay --- #

sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si

# --- Install dotfile requirements --- #

yay -Syyu stow zsh zsh-autosuggestions zsh-syntax-highlighting openssh hyprland # Packages
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" # Oh My Zsh