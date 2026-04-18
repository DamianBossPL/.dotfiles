#!/bin/sh

cd "$(dirname "$0")" || exit

if ! command -v whiptail > /dev/null 2>&1; then
  echo "Error: whiptail command not found." >&2
  echo "Is 'libnewt' installed?" >&2
  exit 1
fi

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
    --yesno "Do you want to first apply configurations? This may be destructive:\n\n$(pwd) $ stow --adopt ." 10 75 \
    3>&1 1>&2 2>&3
}

stow_files() {
  echo stow --adopt .
  stow --adopt .
}

get_profile() {
  case "$1" in
    "base")
      echo "fish git jq stow yay";;
    "base:dinit")
      echo "artix-archlinux-support turnstile-dinit";;
    "base:dinit:post")
      echo "sudo dinitctl enable turnstiled";;

    "desktop")
      echo "noto-fonts noto-fonts-cjk ttf-agave-nerd ttf-ms-fonts ttf-twemoji autotiling awww foot gnome-keyring hyprpicker lxqt-policykit rofi rofi-emoji swayfx swayidle swaylock swaync waybar wl-clipboard wl-clip-persist xorg-xwayland adw-gtk3-theme kvantum kvantum-qt5 libadwaita-without-adwaita matugen xdg-desktop-portal xdg-desktop-portal-gtk xdg-desktop-portal-wlr";;
    "desktop:systemd")
      echo "runapp uwsm";;
    "desktop:systemd:post")
      echo "systemctl --user enable autotiling awww cliphist foot lxqt-policykit swayidle swaync swaysounds waybar";;
    "desktop:dinit")
      echo "dex";;

    "desktop-apps")
      echo "cava 7zip android-udev gvfs thunar thunar-archive-plugin thunar-media-tags-plugin thunar-volman tumbler unrar yazi zip";;
    
    "background")
      echo "pipewire pipewire-alsa pipewire-audio pipewire-pulse wireplumber blueman bluez bluez-obex bluez-utils";;
    "background:systemd:post")
      echo "systemctl --user enable pipewire pipewire-pulse wireplumber bluetooth";;
    "background:dinit")
      echo "pipewire-dinit pipewire-pulse-dinit wireplumber-dinit bluez-dinit";;
    "background:dinit:post")
      echo "dinitctl enable pipewire && dinitctl enable pipewire-pulse && dinitctl enable wireplumber && sudo dinitctl enable bluetoothd";;

    "suite")
      echo "auto-cpufreq baobab btop bun calf cmatrix easyeffects flatpak gamemode gnome-font-viewer gtk4-demos gvfs-smb helvum inkscape iwgtk kdenlive krita lsp-plugins-lv2 mpv mpv-mpris obs-cmd obs-studio openssh pavucontrol prismlauncher spotify spotify-adblock steam swayimg tailscale vesktop-bin visual-studio-code-bin wine wine-gecko wine-mono winetricks ydotool zen-browser-bin";;
    "suite:systemd:post")
      echo "systemctl --user enable gamemoded";;
    "suite:dinit")
      echo "auto-cpufreq-dinit tailscale-dinit";;
    "suite:dinit:post")
      echo "sudo dinitctl enable auto-cpufreq && sudo dinitctl enable tailscaled";;
  esac
}

INIT=$(ps -p 1 -o comm=)

if prompt_stow; then
  stow_files
fi

while true; do
  choice=$(prompt_profile)
  if [ -z "$choice" ]; then
    break
  fi

  packages_choice=$(get_profile "$choice") 
  packages_init=$(get_profile "$choice:$INIT") 
  packages=$(echo "$packages_choice $packages_init" | xargs)

  if prompt_install "$packages"; then
    cmd="yay -S --needed $packages"

    echo "$cmd"
    eval "$cmd"

    echo

    cmd=$(get_profile "$choice:$INIT:post")
    echo "$cmd"
    eval "$cmd"

    printf "Press ENTER to continue"
    # shellcheck disable=SC2034
    read -r dummy
  fi
done

