#!/bin/bash

pw-relink-id() {
  local ports=$(pw-dump "$1" | jq -r '.[].info | "\(.["output-port-id"]) \(.["input-port-id"])"')
  read -r xdph target <<< "$ports"

  pw-link -d "$1" 2>/dev/null
  pw-link "$xdph" "$target"
}

relink() {
  pw-link -lI | grep "xdg-desktop-portal-hyprland" | awk '{print $1}' | sed -n '2~2p' | while read -r id; do
    pw-relink-id "$id"
  done
}

swaymsg -m -t subscribe '["output"]' | while read -r line; do
  relink
done
