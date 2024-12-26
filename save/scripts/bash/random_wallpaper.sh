#!/bin/bash
find ~/Images/Wallpapers -type f \( -iname \*.jpg -o -iname \*.png \) -print0 | shuf -n1 -z | xargs -0 wal -i
