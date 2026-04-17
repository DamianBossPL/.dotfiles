> [!WARNING] This dotifles repo is in pre-alpha, meaning it's incomplete and not fully usable. Do not use this on your main system unless you know what you're doing.

<div align="center">
<h1> <——— DamianBossPL's .dotfiles ———></h1>

![](https://img.shields.io/github/last-commit/DamianBossPL/.dotfiles?style=for-the-badge&logo=git&labelColor=000000&color=0549a4&logoColor=da578b)
![](https://img.shields.io/github/repo-size/DamianBossPL/.dotfiles?style=for-the-badge&logo=files&labelColor=000000&color=0549a4&logoColor=da578b)

</div>

<div align="center">
  <h1> <——— OVERVIEW ———></h1>
</div>

![Image of the SwayFX environment with the dotfiles applied](./desktop.png)

_Arch Linux systemd, and Artix Linux dinit supported only._

## Setup

This script abstracts the process of installing the dotfiles repo:

```sh
curl -fsSL https://raw.githubusercontent.com/DamianBossPL/.dotfiles/main/pull.sh | sh
```

<details>
  <summary>Packages</summary>

Packages listed here are under headers, corresponding to the installable profiles in the setup script. Some profles may include different packages due to the host's init system. For example, a systemd host will install uwsm, whilst a dinit host will not. However, much of the functionality shouldn't be compromised due to this.

## Base

- `fish`
  - Default and fast shell
- `git`
  - Version control
- `jq`
  - CLI JSON processor
- `stow`
  - Applies dotfiles
- `yay`
  - AUR helper

## Desktop

### Fonts

- `ttf-agave-nerd`
  - Default font
- `ttf-ms-fonts`
  - Every other needed font
- `ttf-twemoji`
  - Emoji font

### Environment

- `autotiling`
  - Dwindle tiling for Sway
- `awww`
  - Wallpaper daemon
- `foot`
  - Minimal Wayland terminal
- `gnome-keyring`
  - Stores passwords and encryption keys
- `hyprpicker`
  - Color picker and screen freezer for screenshots
- `lxqt-policykit`
  - Polkit agent
- `rofi`
  - Application launcher and dmenu
- `rofi-emoji`
  - Emoji picker
- `swayfx`
  - Tiling WM
- `swayidle`
  - Idle management
- `swaylock`
  - Lock screen
- `swaync`
  - Notification daemon and centre
- `waybar`
  - Status bar
- `wl-clipboard`
  - CLI copy/paste utilities
- `wl-clip-persist`
  - Persists copied content after the source has closed
- `xorg-xwayland`
  - Support for X under Wayland

#### Systemd

- `runapp`
  - Fast application runner for uwsm
- `uwsm`
  - Wayland session manager

#### Dinit

- `dex`
  - Autostart apps

### Styling

- `adw-gtk3-theme`
  - Consistent libadwaita theming foTK
- `kvantum`
  - QT6 theming
- `kvantum-qt5`
  - QT5 theming
- `libadwaita-without-adwaita`
  - Fixes theming for libadwaita
- `matugen`
  - Material You color scheme generator

### Desktop Portals

- `xdg-desktop-portal`
  - Daemon to make portals accessible
- `xdg-desktop-portal-gtk`
  - Generic portal
- `xdg-desktop-portal-wlr`
  - Screen sharing

## Desktop Apps

- `cava`
  - TUI audio visualiser

### File Management

- `7zip`
  - Support for 7z files
- `android-udev`
  - Allow connection of android devices
- `gvfs`
  - Trash, protocols, mounting flash drives, etc
- `thunar`
  - File manager
- `thunar-archive-plugin`
  - Adds archive support to thunar
- `thunar-media-tags-plugin`
  - Add features for media files
- `thunar-volman`
  - Allows removable devices
- `unrar`
  - Support for rar files
- `yazi`
  - TUI file manager
- `zip`
  - Support for zip files

## Background

### Sound

- `pipewire`
  - Main audio server
- `pipewire-alsa`
  - Pipewire alsa support
- `pipewire-audio`
  - Pipewire audio support
- `pipewire-pulse`
  - Pipewire PulseAudio support
- `wireplumber`
  - Pipewire session manager

#### Dinit

- `pipewire-dinit`
- `pipewire-pulse-dinit`
- `wireplumber-dinit`

### Bluetooth

- `blueman`
  - Bluetooth GUI manager
- `bluez`
  - Bluetooth daemon
- `bluez-obex`
  - Bluetooth obex support
- `bluez-utils`
  - CLI tools for bluez

## Damian's Suite

- `auto-cpufreq`
  - Modes for power usage
- `baobab`
  - Disk usage analyzer
- `btop`
  - System Monitor
- `bun`
  - High performance TS/JS runtime
- `calf`
  - Effects for EasyEffects
- `cmatrix`
  - Matrix TUI to scare people
- `easyeffects`
  - Add audio effects to input/output
- `flatpak`
  - Run sandoxed software
- `gamemode`
  - Daemon for applying system settings when running games
- `gnome-font-viewer`
  - View all fonts on the system
- `gtk4-demos`
  - Showcase GTK theming
- `gvfs-smb`
  - Allow gvfs to connect with SMB
- `helvum`
  - Pipewire patch bay
- `inkspace`
  - SVG editing
- `iwgtk`
  - GTK 4 iwd manager
- `kdenlive`
  - Video editing
- `krita`
  - Picture editing
- `lsp-plugins-lv2`
  - Effects for EasyEffects
- `mpv`
  - Media player
- `mpv-mpris`
  - Mpris support for mpv
- `obs-cmd`
  - CLI to control obs-studio
- `obs-studio`
  - Recording software
- `openssh`
  - SSH client
- `pavucontrol`
  - Audio control
- `prismlauncher`
  - Minecraft launcher
- `spotify`
  - Music streaming
- `spotify-adblock`
  - Block ads on spotify
- `steam`
  - Games
- `swayimg`
  - Image viewer
- `tailscale`
  - Easy mesh VPN to stay connected with devices
- `vesktop-bin`
  - Vesktop Discord client
- `wine`
  - Run Windows programs
- `wine-mono`
  - Wine .NET
- `winetricks`
  - Configure Wine stuff
- `ydotool`
  - Simulate keyboard/mouse
- `zen-browser-bin`
  - Firefox-based browser

#### Dinit

- `autocpu-freq-dinit`

## Dinit

- `tunstile-dinit`

  </details>
