> [!WARNING] This dotifles repo is in pre-alpha, meaning it's incomplete and not fully usable. Do not use this on your main system unless you know what you're doing.

<div align="center">
  <h1> <——— DamianBossPL's .dotfiles ———></h1>

![](https://img.shields.io/github/last-commit/DamianBossPL/.dotfiles?style=for-the-badge&logo=git&labelColor=000000&color=0549a4&logoColor=da578b)
![](https://img.shields.io/github/repo-size/DamianBossPL/.dotfiles?style=for-the-badge&logo=files&labelColor=000000&color=0549a4&logoColor=da578b)

</div>

<div align="center">
  <h1> <——— OVERVIEW ———></h1>
</div>

![Image of SwayFX, featuring Visual Studio Code, btop, and foot terminal with fastfetch and fish](./desktop.png)

## Setup

This script abstracts the process of installing the dotfiles repo:

```sh
curl -fsSL https://raw.githubusercontent.com/DamianBossPL/.dotfiles/main/pull.sh | sh
```

<details>
  <summary>Install</summary>

</details>

<details>
  <summary>Packages</summary>

## Base

- `fish`
  - Default and fast shell
- `git`
  - Version control
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
- `ttf-twemoji-color`
  - Emoji font

### Environment

- `uwsm`
  - Wayland session manager
- `swayfx`
  - Tiling WM
- `waybar`
  - Status bar
- `rofi`
  - Application launcher and dmenu
- `foot`
  - Minimal Wayland terminal
- `swaync`
  - Notification daemon and centre
- `swaylock`
  - Lock screen
- `hyprpicker`
  - Color picker and screen freezer for screenshots
- `lxqt-policykit`
  - Polkit agent
- `wl-clipboard`
  - CLI copy/paste utilities
- `wl-clip-persist`
  - Persists copied content after the source has closed

### Styling

- `matugen`
  - Material You color scheme generator
- `libadwaita-without-adwaita`
  - Fixes theming for libadwaita
- `kvantum`
  - QT6 theming
- `kvantum-qt5`
  - QT5 theming

### Desktop Portals

- `xdg-desktop-portal`
  - Daemon to make portals accessible
- `xdg-desktop-portal-gtk`
  - Generic portal
- `xdg-desktop-portal-slr`
  - Screen sharing

## Desktop Apps

- `zen-browser-bin`
  - Firefox-based browser
- `vesktop-bin`
  - Vesktop Discord client
- `btop`
  - System Monitor
- `pavucontrol`
  - Audio control

### File Management

- `thunar`
  - File manager
- `thunar-volman`
  - Allows removable devices
- `gvfs`
  - Trash, protocols, mounting flash drives, etc
- `yazi`
  - TUI file manager

## Extra (Full System)

- `auto-cpufreq`
  - Modes for power usage
- `gamemode`
  - Daemon for applying system settings when running games

### Sound

- `pipewire`
  - Main audio server
- `pipewire-audio`
  - Pipewire audio support
- `pipewire-alsa`
  - Pipewire alsa support
- `pipewire-pulse`
  - Pipewire PulseAudio support
- `wireplumber`
  - Pipewire session manager

### Bluetooth

- `bluez`
  - Bluetooth daemon
- `bluez-obex`
  - Bluetooth obex support
- `bluez-utils`
  - CLI tools for bluez
- `blueman`
  - Bluetooth GUI manager
  </details>
