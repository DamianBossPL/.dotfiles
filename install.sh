#!/bin/bash

cd "$(dirname "$0")"

export NEWT_COLORS='
  root=,default
  window=,default
  border=white,default
  shadow=,default
  title=white,default
  textbox=white,default
  listbox=white,default
  actlistbox=white,blue
  button=white,red
  compactbutton=white,default
'

whiptail() {
  command whiptail --title "DamianBossPL's .dotfiles" "$@"
}

prompt_profile() { 
  whiptail \
    --menu "Select a package profile" 20 40 5 \
    --ok-button "Preview" \
    --cancel-button "Exit" \
    --notags \
    "base" "Base" \
    "desktop" "Desktop" \
    "desktop-apps" "Desktop Apps" \
    "background" "Background" \
    "suite" "Damian's Suite" \
    3>&1 1>&2 2>&3
}

prompt_install() {
  whiptail \
    --yesno "You are about to install these packages:\n\n$1" 20 75 \
    3>&1 1>&2 2>&3
}

prompt_stow() { 
  whiptail \
    --yesno "Do you want to first apply configurations?\n\n$(pwd) $ stow --adopt ." 10 75 \
    3>&1 1>&2 2>&3
}

stow-files() {
  stow --adopt .
}

declare -A profiles
profiles=(
  ["base"]="fish git jq stow yay"
  ["base:dinit"]="artix-archlinux-support turnstile-dinit"
  ["base:dinit:post"]="sudo dinitctl enable turnstiled"

  ["desktop"]="ttf-agave-nerd ttf-ms-fonts ttf-twemoji autotiling awww foot gnome-keyring hyprpicker lxqt-policykit rofi rofi-emoji swayfx swayidle swaylock swaync waybar wl-clipboard wl-clip-persist xorg-xwayland adw-gtk3-theme kvantum kvantum-qt5 libadwaita-without-adwaita matugen xdg-desktop-portal xdg-desktop-portal-gtk xdg-desktop-portal-wlr"
  ["desktop:systemd"]="runapp uwsm"
  ["desktop:systemd:post"]="systemctl --user enable autotiling awww cliphist foot lxqt-policykit swayidle swaync swaysounds waybar"
  ["desktop:dinit"]="dex"

  ["desktop-apps"]="cava 7zip android-udev gvfs thunar thunar-archive-plugin thunar-media-tags-plugin thunar-volman unrar yazi zip"
  
  ["background"]="pipewire pipewire-alsa pipewire-audio pipewire-pulse wireplumber blueman bluez bluez-obex bluez-utils"
  ["background:systemd:post"]="systemctl --user enable pipewire pipewire-pulse wireplumber bluetooth"
  ["background:dinit"]="pipewire-dinit pipewire-pulse-dinit wireplumber-dinit bluez-dinit"
  ["background:dinit:post"]="dinitctl enable pipewire && dinitctl enable pipewire-pulse && dinitctl enable wireplumber && dinitctl enable bluetoothd"

  ["suite"]="auto-cpufreq baobab btop bun calf cmatrix easyeffects flatpak gamemode gnome-font-viewer gtk4-demos gvfs-smb helvum inkscape iwgtk kdenlive krita lsp-plugins-lv2 mpv mpv-mpris obs-cmd obs-studio openssh pavucontrol prismlauncher spotify spotify-adblock steam swayimg tailscale vesktop-bin visual-studio-code-bin wine wine-gecko wine-mono winetricks ydotool zen-browser-bin"
  ["suite:systemd:post"]="systemctl --user enable gamemoded"
  ["suite:dinit"]="auto-cpufreq-dinit"
)

INIT=$(ps -p 1 -o comm=)

if prompt_stow; then
  stow-files
fi

while true; do
  CHOICE=$(prompt_profile)
  if [[ -z "$CHOICE" ]]; then
    break
  fi
  
  packages=$(echo "${profiles[$CHOICE]} ${profiles[$CHOICE:$INIT]}" | xargs)
  if prompt_install "$packages"; then
    cmd="yay -S --needed ${packages}"

    echo "$cmd"
    eval "$cmd"

    echo

    cmd="${profiles[$CHOICE:$INIT:post]}"
    echo "$cmd"
    eval "$cmd"

    read -rp "Press ENTER to continue"
  fi
done

