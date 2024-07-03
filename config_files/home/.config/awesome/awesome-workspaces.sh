#!/bin/bash

# Appeler le script Lua et formater la sortie pour Polybar
workspaces=$(awesome-client "dofile('/home/ludji/.config/awesome/awesome-workspaces.lua')")
echo "Workspaces: $workspaces"
