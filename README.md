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

_Arch Linux systemd, and Artix Linux dinit supported only._

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

Packages listed here are under headers, corresponding to the installable profiles in the setup script. Some profles may include different packages due to the host's init system. For example, a systemd host will install uwsm, whilst a dinit host will not. However, much of the functionality shouldn't be compromised due to this.

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

- `swayfx`
  - Tiling WM
- `autotiling`
  - Dwindle tiling for Sway
- `awww`
  - Wallpaper
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

#### Systemd

- `uwsm`
  - Wayland session manager
- `runapp`
  - Fast application runner for uwsm

#### Dinit

- `dex`
  - Autostart apps

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

#### Dinit

- `autocpu-freq-dinit`

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

#### Dinit

- `pipewire-dinit`
- `pipewire-pulse-dinit`
- `wireplumber-dinit`

### Bluetooth

- `bluez`
  - Bluetooth daemon
- `bluez-obex`
  - Bluetooth obex support
- `bluez-utils`
  - CLI tools for bluez
- `blueman`
  - Bluetooth GUI manager

## Dinit

- `tunstile-dinit`

  </details>
