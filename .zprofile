# Start Hyprland on login
export XDG_DATA_DIRS="$HOME/.local/share:$XDG_DATA_DIRS"

if command -v uwsm >/dev/null 2>&1 && uwsm check may-start; then
    exec uwsm start hyprland.desktop
fi
