export XDG_DATA_DIRS="$HOME/.local/share:$XDG_DATA_DIRS"

export XCURSOR_THEME=Posy_Cursor
export XCURSOR_SIZE=32

export QT_QPA_PLATFORMTHEME=gtk3
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1

export ELECTRON_OZONE_PLATFORM_HINT=wayland

export WLR_NO_HARDWARE_CURSORS=1

# Start River on tty1 on login
if [ -z "$WAYLAND_DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
  XDG_CURRENT_DESKTOP=sway exec sway
fi
