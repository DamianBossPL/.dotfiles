#!/bin/bash

cd "$(dirname "$0")"

print() {
  echo "[DOTFILES] $1"
}

usage() {

  exit 1
}

prompt() {  
  local selection=$(NEWT_COLORS="root=white,black" whiptail --title "DamianBossPL's .dotfiles" \
    --menu "Pick an install profile" 15 30 4 \
    "1" "CLI Only" \
    "2" "Full" \
    3>&1 1>&2 2>&3)
    
  if [ $? -eq 0 ]; then
    echo "$selection"
  else
    echo 0
  fi
}

install-packages() {
  print "RUN: install packages"
  # yay -S --needed "${packages[@]}"
  print "DONE: install packages"
}

stow-files() {
  print "RUN: stowing"
  stow --adopt .
  print "DONE: stowing"
}

SYSTEMD_UNITS=(anyrun autotiling foot gamemoded lxqt-policykit swaync swww thunar waybar)
systemd-enable() {
  print "RUN: enable systemd user units"
  systemctl --user enable "${SYSTEMD_UNITS[@]}"
  print "DONE: enable systemd user units"
}

level1=(fish git stow yay)
level2=(ttf-agave-nerd ttf-ms-win11-auto ttf-twemoji-color swayfx python-pywal wpgtk libadwaita-without-adwaita hyprpicker waybar network-manager-applet power-profiles-daemon pavucontrol swaync rofi rofi-emoji swaylock lxqt-policykit pipewire pipewire-audio pipewire-alsa pipewire-pulse wireplumber xdg-desktop-portal xdg-desktop-portal-gtk xdg-desktop-portal-hyprland gvfs thunar thunar-volman cliphist wl-clip-persist bluez bluez-obex bluez-utils blueman)

packages=()

CHOICE=$(prompt)
case "$CHOICE" in
  "1")
    print "Installing profile: CLI Only"

    packages+=("${level1[@]}")
    install-packages

    stow-files
    ;;
  "2")
    print "Installing profile: Full"

    packages+=("${level1[@]}")
    packages+=("${level2[@]}")
    install-packages

    stow-files
    systemd-enable
    ;;
  "0")
    print "Installation cancelled"
    exit 1
    ;;
  *)
    print "Selected choice invalid"
    exit 1
    ;;
esac

print "COMPLETE"