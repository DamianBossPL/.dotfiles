#!/bin/sh

# Argument 1
# none -> toggle DND
# 1    -> enable DND
# 0    -> disable DND

if [ -z "$1" ]; then
  makoctl mode -t do-not-disturb
elif [ "$1" = "1" ]; then
  makoctl mode -a do-not-disturb
elif [ "$1" = "0" ]; then
  makoctl mode -r do-not-disturb
fi
