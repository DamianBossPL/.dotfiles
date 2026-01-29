#!/bin/bash

# Udev events without use of root privledges anywhere

# Monitor udev events via script
udevadm monitor --udev --property | \
while IFS= read -r line; do
  # --- CAPTURE EVENT PROPERTIES --- #
  if [[ "$line" == ACTION=* ]]; then
    action="${line#ACTION=}"
  elif [[ "$line" == SUBSYSTEM=* ]]; then
    subsystem="${line#SUBSYSTEM=}"
  elif [[ "$line" == DEVTYPE=* ]]; then
    devtype="${line#DEVTYPE=}"
  fi

  # On empty line (event description ended)
  if [[ -z "$line" ]]; then
    # USB
    if [[ "$subsystem" == "usb" && "$devtype" == "usb_device" ]]; then
      # USB Plug
      if [[ "$action" == "add" ]]; then
        canberra-gtk-play -i device-added &
      # USB Unplug
      elif [[ "$action" == "remove" ]]; then
        canberra-gtk-play -i device-removed &
      fi
    fi

    # Reset variables for next event
    action=""
    subsystem=""
    devtype=""
  fi
done
