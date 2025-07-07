# Start Hyprland on login
if command -v uwsm >/dev/null 2>&1 && uwsm check may-start; then
    exec uwsm start hyprland.desktop
fi
