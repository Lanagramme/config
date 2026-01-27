#!/bin/sh

# Export X variables early
export DISPLAY="$DISPLAY"
export XAUTHORITY="$HOME/.Xauthority"

# Make them visible to systemd --user (Flatpak / portals need this)
systemctl --user set-environment DISPLAY="$DISPLAY"
systemctl --user set-environment XAUTHORITY="$XAUTHORITY"

exec awesome

