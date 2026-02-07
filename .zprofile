export XDG_DATA_DIRS="$HOME/.local/share:$XDG_DATA_DIRS"
export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH"

export XCURSOR_THEME=Posy_Cursor
export XCURSOR_SIZE=32

export QT_QPA_PLATFORMTHEME=gtk3
dbus-update-activation-environment --systemd QT_QPA_PLATFORMTHEME
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1

export ELECTRON_OZONE_PLATFORM_HINT=wayland

export WLR_NO_HARDWARE_CURSORS=1

# Start Sway on tty1
if [ -z "$WAYLAND_DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
  export XDG_CURRENT_DESKTOP=sway
  dbus-update-activation-environment --systemd XDG_CURRENT_DESKTOP
  exec sway
fi
