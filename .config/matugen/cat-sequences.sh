#!/bin/bash

SEQUENCES="$HOME/.cache/terminal-sequences"

if [ ! -f "$SEQUENCES" ]; then
  echo "Sequence file not found"
  exit 1
fi

for tty in /dev/pts/[0-9]*; do
  if [ -w "$tty" ]; then
    cat "$SEQUENCES" > "$tty" &
  fi
done
