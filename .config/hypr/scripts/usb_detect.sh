#!/usr/bin/env sh

#########################
# --- USB Detection --- #
#########################

udevadm monitor --udev --property | \
while IFS= read -r line; do
  # Capture udev event properties
  if [[ "$line" == ACTION=* ]]; then
    action="${line#ACTION=}"
  elif [[ "$line" == SUBSYSTEM=* ]]; then
    subsystem="${line#SUBSYSTEM=}"
  elif [[ "$line" == DEVTYPE=* ]]; then
    devtype="${line#DEVTYPE=}"
  fi

  # When we get an empty line, it means event ended, check condition
  if [[ -z "$line" ]]; then
    if [[ "$subsystem" == "usb" && "$devtype" == "usb_device" ]]; then
      # USB Plug
      if [[ "$action" == "add" ]]; then
        canberra-gtk-play -i device-added &
      # USB Unlug
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
